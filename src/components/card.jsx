import React from 'react'
import './card.css'

Card.defaultProps = {
  title: '[Insert Title]'
};

export default function Card({ title, img }) {
  return (
    <div className='window-card'>
        <div className='window-card-header'>
            <h3>{title}</h3>
            <div className="window-card-controls">
                <div className="circle" style={{ backgroundColor: 'red'}}></div>
                <div className="circle" style={{ backgroundColor: 'gold'}}></div>
                <div className="circle" style={{ backgroundColor: 'green' }}></div>
            </div>
        </div>
        <div className='window-card-body'>
            <img className='window-card-img' src={img}></img>
        </div>
    </div>
  )
}
