import PropTypes from "prop-types";
import CardAddressBar from "./card-address-bar";
import "./card.css";

const tabHeader = (onTabClick) => {
  const handleTabClick = (tab) => {
    const tabs = document.querySelectorAll(".card-tab");
    tabs.forEach((t) => t.classList.remove("selected"));
    document.querySelector(`.card-tab-${tab}`).classList.add("selected");
    onTabClick(tab);
  };

  return (
    <div className="card-tab-header">
      <a
        className={`card-tab card-tab-login`}
        onClick={() => handleTabClick("login")}
        style={{ cursor: "pointer" }}
      >
        <h3>Login</h3>
      </a>
      <a
        className={`card-tab card-tab-register`}
        onClick={() => handleTabClick("register")}
        style={{ cursor: "pointer" }}
      >
        <h3>Register</h3>
      </a>
    </div>
  );
};

Card.propTypes = {
  title: PropTypes.string,
  img: PropTypes.string,
  children: PropTypes.node,
  activeForm: PropTypes.string,
  onTabClick: PropTypes.func,
  url: PropTypes.string,
};

export default function Card({
  title = "[Insert Title]",
  img,
  children,
  activeForm,
  onTabClick,
  url,
}) {
  return (
    <div className="window-card">
      {/* Card Header */}

      <div className="card-header">
        <div className="window-card-header">
          {tabHeader(onTabClick)}
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
        {url && <CardAddressBar url={"42+/" + url}></CardAddressBar>}
      </div>

      <div className="window-card-body">
        {children}
        {img && <img className="window-card-img" src={img}></img>}
      </div>
    </div>
  );
}
