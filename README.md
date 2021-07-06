# Pass Watcher
Pass Watcher will send a Webhook to Discord or Telegram with every gym that recieved an EX Pass this wave. It can also notify you about gyms that recently got their EX Tag.
Get support on the [PMSF Discord Server](https://discord.gg/URp4zMP)

## How does it work?
Gyms lose their EX Tag when there's a EX Raid scheduled on it. Pass Watcher makes use of this mechanic by checking if a gym lost its EX Tag. When running the script, it will first put all EX gyms in the extra table and then compare it with your gym table to see if any gym lost its EX tag.
It's possible to have Pass Watcher send Webhooks to Discord or Telegram, but it's totally fine to turn them off and just have the script fill in the extra table.


![Sample message with default config options](https://i.imgur.com/ujixheG.png)

*Sample message with default config options*

## Usage
1. Create a new DB and import the `ex_gyms` table using the `ex_gyms.sql` file.
2. `git clone https://github.com/ccev/passwatcher.git` then copy and rename `default.ini.example` to `default.ini` and fill out everything.
3. `docker-compose up -d passwatcher`
4. The script to run in a loop hourly.
5. When the script runs first time, it will fill out the extra table and that's it. First pass webhooks will be going out next time passes are given out.

## Configs
Important config options that aren't self explanatory:
- `WEBHOOK_URL`: Needs to be in `[""]` - you can send multiple webhooks by formatting them like this: `["https://www.url.com/1","https://www.url.com/2"]`
- `BBOX`: http://bboxfinder.com/ - draw a rectangle - copy the numbers right to the `Box` part on the bottom
- `SCANNER_DB_NAME` = The database where your scanned data is in. `MANUAL_DB_NAME` = The database where your extra table is in (preferably your PMSF manualdb)
- `LANGUAGE`: You can use your own custom language files by copying locale/en.json and renaming the file to whatever your put here
