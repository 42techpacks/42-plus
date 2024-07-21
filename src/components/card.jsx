import PropTypes from "prop-types";
import "./card.css";

Card.propTypes = {
  title: PropTypes.string,
  img: PropTypes.string,
  children: PropTypes.node,
};

export default function Card({ title = "[Insert Title]", img, children }) {
  return (
    <div className="window-card">
      <div className="window-card-header">
        <h3>{title}</h3>
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
      <div className="window-card-body">
        {children}
        {img && <img className="window-card-img" src={img}></img>}
      </div>
    </div>
  );
}
