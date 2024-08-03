import { useState } from "react";
import "./cf42-mini-site.css";
import Card from "../../card";
import ShopifyBuyButton from "../../mini-site-components/shopify-buy-button/shopify-buy-button";
import CF42Card from "./cf42-card";
import Enter from "./enter/enter";
import Button from "../../button";
import CF42Store from "./cf42-store";
import CF42Nav from "./cf42-nav";
import CF42NavMini from "./cf42-nav-mini";
import CF42MainMenu from "./cf42-main-menu";
import CF42PackStore from "./cf42-pack-store";

export default function CF42MiniSite() {
  const [activePage, setActivePage] = useState("enter");
  const [subPage, setSubPage] = useState(false);

  const handleNavClick = (page) => {
    console.log("CF42 Nav item clicked..." + page);
    setActivePage(page);

    const pages = document.querySelectorAll(".cf42-nav-item");
    pages.forEach((p) => p.classList.remove("selected"));
    document.querySelector(`.cf42-nav-${page}`).classList.add("selected");
  };

  return (
    <div className="cf42-mini-site">
      <Card title="CF42" url={"CF42.exe"}>
        {/* Display header nav upon 'launching' app */}
        {activePage !== "enter" &&
          (subPage ? (
            subPage === "pack-store" && (
              <CF42PackStore
                exitFn={() => {
                  setSubPage(false);
                  handleNavClick("store");
                }}
              />
            )
          ) : (
            <CF42MainMenu
              handleNavClick={handleNavClick}
              setSubPage={setSubPage}
              activeMenu={activePage}
            />
          ))}

        {/* 'ENTER' Component displayed upon load */}
        {activePage === "enter" && (
          <Enter>
            <Button label="START GAME" onClick={() => handleNavClick("home")} />
          </Enter>
        )}
      </Card>
    </div>
  );
}
