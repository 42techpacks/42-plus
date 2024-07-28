import React from 'react';
import { render, screen } from '@testing-library/react';
import Card from '../card';

describe('Card Component', () => {
  test('renders card component', () => {
    render(<Card />);
    const cardElement = screen.getByTestId('card-component');
    expect(cardElement).toBeInTheDocument();
  });
});
