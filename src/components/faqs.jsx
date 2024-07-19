import React from "react";

import "./faqs.css";

import Card from "./card";

export default function FAQs() {
  return (
    <div className="faqs">
      <Card title={"FAQ #1"}>
        <p>
          With 42+, you have access to exclusive pre-order releases of upcoming
          FORTYTWO products at reduced prices
        </p>
      </Card>
      <Card title={"FAQ #2"}>
        <p>
          Items available for pre-order have extended shipping times (8-10
          weeks) and reduced prices (up to 50% off) compared to retail.
        </p>
      </Card>
    </div>
  );
}
