import "./cf42-nav-mini.css";

export default function CF42NavMini({ handleClick }) {
  return (
    <div className="cf42-nav-mini" onClick={handleClick}>
      <img src="/chevron-left.svg" />
      <a>Back</a>
    </div>
  );
}
