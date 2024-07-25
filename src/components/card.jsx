import PropTypes from "prop-types";
import CardAddressBar from "./card-address-bar";
import "./card.css";

const tabHeader = (tabs, onTabClick) => {
  const handleTabClick = (tab) => {
    /* TO-DO: Limit search to target component (don't want to affect other cards) */
    const tabs = document.querySelectorAll(".card-tab");
    tabs.forEach((t) => t.classList.remove("selected"));
    document.querySelector(`.card-tab-${tab}`).classList.add("selected");
    onTabClick(tab);
  };

  return (
    <div className="card-tab-header">
      {tabs &&
        tabs.map((tab, index) => (
          <a
            key={tab}
            className={`card-tab card-tab-${tab} ${
              index === 0 ? "selected" : ""
            }`}
            onClick={() => handleTabClick(tab)}
            style={{ cursor: "pointer" }}
          >
            <h3>{tab.charAt(0).toUpperCase() + tab.slice(1)}</h3>
          </a>
        ))}
    </div>
  );
};

Card.propTypes = {
  title: PropTypes.string,
  img: PropTypes.string,
  children: PropTypes.node,
  activeForm: PropTypes.string,
  tabs: PropTypes.array,
  onTabClick: PropTypes.func,
  onArrowClick: PropTypes.func,
  url: PropTypes.string,
  pageIndex: PropTypes.number,
};

export default function Card({
  title = "[Insert Title]",
  img,
  children,
  activeForm,
  tabs,
  onTabClick,
  onArrowClick,
  pageIndex,
  url,
}) {
  return (
    <div className="window-card">
      {/* Card Header */}

      <div className="card-header">
        <div className="window-card-header">
          {onTabClick && tabHeader(tabs, onTabClick)}
          {title && <h3>{title}</h3>}
          <div className="window-card-controls">
            <div className="circle card-exit"></div>
            <div className="circle card-minimize"></div>
            {/* Testing window card interactivity */}
            <div
              className="circle card-maximize"
              onClick={(e) => {
                e.target.closest(".window-card").style.height = "1000px";
              }}
            ></div>
          </div>
        </div>
        {url && (
          <CardAddressBar
            onArrowClick={onArrowClick}
            url={"42+/" + url}
            pageIndex={pageIndex}
          ></CardAddressBar>
        )}
      </div>

      <div className="window-card-body">
        {children}
        {img && <img className="window-card-img" src={img}></img>}
      </div>
    </div>
  );
}
