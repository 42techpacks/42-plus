import { useContext, useEffect, useState } from "react";
import { UserContext } from "../App";
import "./beta-mini-site.css";
import Card from "./card";
import CreationList from "./creation-list";
import { supaClient } from "../supa-client";

export default function BetaMiniSite() {
  const { profile } = useContext(UserContext);
  const [activeTab, setActiveTab] = useState("welcome");
  const [pageIndex, setPageIndex] = useState(0);
  const [completedSteps, setCompletedSteps] = useState(0);
  const [userCreationIndex, setUserCreationIndex] = useState(42);
  const [orderedUserList, setOrderedUserList] = useState([
    "kennyosele",
    "npcmilo",
    "faizan.a",
  ]);

  useEffect(() => {
    supaClient
      .from("user_profiles")
      .select("*")
      .order("created_at", { ascending: true })
      .then(({ data, error }) => {
        if (error) {
          console.error("Error fetching user profiles:", error.message);
          //  TODO: can set an error state here to display to the user
          // setError(error.message);
          return;
        }

        if (!data) {
          console.warn("No data returned from user profiles query");
          return;
        }
        try {
          const usernames = data.map((profile) => profile.username);
          setOrderedUserList(usernames);
          if (profile && profile.username) {
            const userIndex = usernames.findIndex(
              (username) => username === profile.username,
            );
            if (userIndex !== -1) {
              setUserCreationIndex(userIndex + 1); // Add 1 because array indices start at 0
            } else {
              console.warn(
                `Username ${profile.username} not found in the fetched data`,
              );
            }
          } else {
            console.warn("Profile or username is undefined");
          }
        } catch (error) {
          console.error("Error processing user profiles data:", error);
          // TODO: can set an error state here to display to the user
          // setError('An error occurred while processing user data');
        }
      });
  }, [profile]);

  const handleTabClick = (tab) => {
    setActiveTab(tab);
    setPageIndex(0);
  };

  const onStep = (step) => {
    if (step === 0) {
      console.error("ERROR: Step not complete");
    }

    setCompletedSteps(completedSteps + 1);
    setPageIndex(pageIndex + 1);
  };

  const handleArrowClick = (step) => {
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
                    : () => {};
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
            <p>Click on the &apos;Announcement&apos; tab!</p>
          </div>
        </div>
      </div>
    ),
  };

  const creationList = {
    buttonHandler: () => onStep(),
    content: (
      <CreationList
        orderedCreationList={orderedUserList}
        userCreationIndex={userCreationIndex}
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
