import CF42NavMini from "./cf42-nav-mini";

export default function CF42PackStore({ exitFn }) {
  return (
    <div className="cf42-pack-store">
      <CF42NavMini handleClick={exitFn} />
      <a>PACK STORE</a>
    </div>
  );
}
