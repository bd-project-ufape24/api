import sqlite3 from "sqlite3";
import { open } from "sqlite";
import { sqls } from "./queries/createTableQuery";

export const createTables = async () => {
	const db = await open({
		filename: "./src/database/data.db",
		driver: sqlite3.Database,
	});

	for (const sql of sqls) {
		await db.exec(sql);
	}

	console.log("Tables created or already exist.");
	await db.close();
};
