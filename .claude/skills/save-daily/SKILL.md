# Save Daily — Project History Convention

> Project-specific save paths for daily goals and daily reports.
> Overrides the default paths suggested by hd-daily-goals and hd-daily-report.

## Convention

All daily files are saved under `history/{DATE}/` using the date from the report header.

| File | Path |
|------|------|
| Daily Goals | `history/YYYY-MM-DD/goal.md` |
| Daily Report | `history/YYYY-MM-DD/report.md` |

## Usage

When `hd-daily-goals` or `hd-daily-report` asks:
> "Save a copy to history/...? [Y/N]"

**Always save to:**
- Goals → `history/{DATE}/goal.md`
- Report → `history/{DATE}/report.md`

If the `history/{DATE}/` directory does not exist, create it first.

## Example

For date `2026-03-03`:
```
history/
└── 2026-03-03/
    ├── goal.md    ← from hd-daily-goals
    └── report.md  ← from hd-daily-report
```

## Instructions for Claude

When saving daily files in this project:
1. Extract `$DATE` from the report header (`YYYY-MM-DD` format)
2. Create directory `history/$DATE/` if it does not exist
3. Save goals to `history/$DATE/goal.md`
4. Save report to `history/$DATE/report.md`
5. Confirm: `✅ Saved: history/$DATE/goal.md` or `✅ Saved: history/$DATE/report.md`
