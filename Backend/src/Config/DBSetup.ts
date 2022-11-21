export const getDbConnectionString = () => {
    let conString = process.env.MONGO_DB_CONNECTION_STRING!;
    console.log('MongoDB connection string: ' + conString);
    return conString;
}