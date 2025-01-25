# Quotimator

To date I had setup a large complex google sheet to support a Sales team in
ensuring the correct entitlements were provided for new clients and that the
associated pricing was appropriate to the deal

## Problem

The sheet was starting to need to support:

- Multiple Regions
- Multiple Currencies
- Variable pricing based on each region
- Differing upstream costs between regions for the same entitlements

The sheet was getting so complex it was becoming difficult to manage and use.

## Solution

Provide an easy to use application to select the appropriate entitlements and
ensure they are priced correctly for the region in the correct currency.

Ensure they are not priced below cost for that region

## Quick Start

Requires quote-server repo for backend

### Install dependancies

`pnpm install`

### Run

`pnpm run dev`

## Details

Designed to be deployed as a classic scalable web app.
I acknowledge the solution is overkill for the use case. This was an opportunity
to fix a problem as well as round out my own understanding of scalable webapps.

## Contributing

This repo is public source not open source. Feel free to fork it but I won't be
accepting PRs.
