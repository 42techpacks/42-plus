import React from "react";
import "./creation-list.css";

export default function CreationList({
  orderedCreationList,
  userCreationIndex,
}) {
  return (
    <div className="creation-list">
      <ol>
        {orderedCreationList.map((user, index) => (
          <li
            key={index}
            className={index === userCreationIndex - 1 ? "current-user" : ""}
          >
            @{user}
          </li>
        ))}
      </ol>
    </div>
  );
}
