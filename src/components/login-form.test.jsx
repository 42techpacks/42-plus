import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import { BrowserRouter } from 'react-router-dom';
import LoginForm from './login-form';

describe('LoginForm Component', () => {
  test('displays user prompt when "Signups not allowed for otp" error occurs', () => {
    render(
      <BrowserRouter>
        <LoginForm />
      </BrowserRouter>
    );

    // Simulate the error
    fireEvent.click(screen.getByText('Submit'));
    // Assuming the error is set in the state
    screen.getByText('Signups are not allowed for OTP. Would you like to register instead?');
  });

  test('redirects to registration flow if user agrees to register', () => {
    render(
      <BrowserRouter>
        <LoginForm />
      </BrowserRouter>
    );

    // Simulate the error
    fireEvent.click(screen.getByText('Submit'));
    // Simulate user agreeing to register
    fireEvent.click(screen.getByText('Yes'));

    // Check if redirected to registration page
    expect(window.location.pathname).toBe('/register');
  });

  test('displays original error message if user declines to register', () => {
    render(
      <BrowserRouter>
        <LoginForm />
      </BrowserRouter>
    );

    // Simulate the error
    fireEvent.click(screen.getByText('Submit'));
    // Simulate user declining to register
    fireEvent.click(screen.getByText('No'));

    // Check if original error message is displayed
    screen.getByText('Signups not allowed for otp');
  });
});
