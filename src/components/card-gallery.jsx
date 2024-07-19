import React from "react";
import Card from "./card";

import "./card-gallery.css";

import { useState, useEffect } from "react";

export default function CardGallery({ imgUrls }) {
  const [currentImgIndex, setCurrentImgIndex] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setCurrentImgIndex((prevIndex) => (prevIndex + 1) % imgUrls.length);
    }, 2000);

    return () => clearInterval(interval);
  }, [imgUrls]);

  return (
    <div className="card-gallery-container">
      <Card title={"Gallery"}>
        <img src={imgUrls[currentImgIndex]} alt="Gallery" />
      </Card>
    </div>
  );
}
