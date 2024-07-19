import React from "react";
import Card from "./card";

import "./featured-product.css";
import CardPreOrder from "./card-preorder";
import CardGallery from "./card-gallery";

export default function FeaturedProduct() {
  return (
    <div className="featured-product">
      <div className="row-1">
        <Card
          title={"42+ Exculsive"}
          img={"../src/assets/colombiaFlatFront.png"}
        ></Card>
      </div>
      <div className="row-3">
        <CardPreOrder
          productName={"Knit Colombia Jersey"}
          retailPrice={"$86"}
          preorderPrice={"$42"}
        ></CardPreOrder>
      </div>
      <div className="row-2">
        <CardGallery
          imgUrls={[
            "../src/assets/colombia-gallery-1.png",
            "../src/assets/colombiaFlatFront.png",
            "../src/assets/colombia-gallery-1.png",
          ]}
        ></CardGallery>
        <Card title={"Description"}>
          <p>
            Fully knit footy-inspured jersey featuring embroidered logo,
            vertical knit pattern, slight crop.
          </p>
        </Card>
      </div>
    </div>
  );
}
