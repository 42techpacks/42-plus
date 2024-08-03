import "./cf42-nav.css";

export default function CF42Nav({ handleClick }) {
  return (
    <div className="cf42-nav">
      <a
        className="cf42-nav-item cf42-nav-home selected"
        onClick={() => handleClick("home")}
      >
        Home
      </a>
      <a
        className="cf42-nav-item cf42-nav-store"
        onClick={() => handleClick("store")}
      >
        Store
      </a>
    </div>
  );
}
