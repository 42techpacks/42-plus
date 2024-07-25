import React, { useContext, useState } from "react";
import { UserContext } from "../App";
import "./beta-mini-site.css";
import Card from "./card";
import CreationList from "./creation-list";

export default function BetaMiniSite({ userCreationIndex }) {
  const { profile } = useContext(UserContext);
  const [activeTab, setActiveTab] = useState("welcome");
  const [pageIndex, setPageIndex] = useState(0);
  const [completedSteps, setCompletedSteps] = useState(0);

  const handleTabClick = (tab) => {
    setActiveTab(tab);
    setPageIndex(0);
  };

  const onStep = (step) => {
    if (step === 0) {
      console.log("ERROR: Step not complete");
    }

    setCompletedSteps(completedSteps + 1);
    setPageIndex(pageIndex + 1);
  };

  const handleArrowClick = (step) => {
    console.log(pageIndex);
    console.log(completedSteps);

    if (pageIndex + step > completedSteps - 1 || pageIndex + step < 0) return;
    setPageIndex(pageIndex + step);
    setCompletedSteps(pageIndex + step);
  };

  const announcement = (
    <video width="100%" height="auto" loop autoPlay muted>
      <source
        src="https://cdn.shopify.com/videos/c/o/v/6e7fe0b76fba4a17b490df12b1385c63.mp4"
        type="video/mp4"
      />
      Your browser does not support the video tag.
    </video>
  );

  const welcome = {
    buttonHandler: () => onStep(),
    content: (
      <div className="welcome">
        <div className="left">
          <h4>Welcome, {profile ? profile.username : "kenny1g"}.</h4>
          <p>
            You are member{" "}
            <a
              id="creation-list-link"
              onClick={() => {
                {
                  flowStep[pageIndex].buttonHandler
                    ? flowStep[pageIndex].buttonHandler()
                    : console.log("on step");
                }
              }}
            >
              #{userCreationIndex}
            </a>{" "}
            of FORTYTWO+.{" "}
          </p>
        </div>
        <div className="right">
          <div className="section">
            <h5>What is 42+?</h5>
            <p>
              42+ is an exclusive online environment where you can explore 42
              products, content, hidden secrets, and other in-house digital
              experiences.
            </p>
          </div>

          <div className="section">
            <h5>What can I expect?</h5>
            <p>Special items. Short films. Games. Contests. Everything 42.</p>
          </div>

          <div className="section">
            <h5>Anything else?</h5>
            <p>Click on the "Announcement" tab!</p>
          </div>
        </div>
      </div>
    ),
  };

  const creationList = {
    buttonHandler: () => onStep(),
    content: (
      <CreationList
        orderedCreationList={["kenny1g", "npcmilo", "faizan.a"]}
        userCreationIndex={2}
      />
    ),
  };

  const flowStep = [welcome, creationList];

  return (
    <div className="beta-mini-site">
      <Card
        title=""
        tabs={["welcome", "announcement"]}
        pageIndex={pageIndex}
        url={"beta"}
        onTabClick={handleTabClick}
        onArrowClick={handleArrowClick}
      >
        {activeTab === "announcement" && announcement}
        {activeTab === "welcome" && flowStep[pageIndex].content}
      </Card>
    </div>
  );
}
