var argv = require('optimist')
    .usage('Usage: $0 --name [name] --template [Default, Selenium]')
    .demand(['name','template'])
    .argv;
var projects = require('../routes/projects');
var common = require('../common');

common.parseConfig(function(){
    common.initDB(common.Config.DBPort,function(){
        projects.projectCreate({name:argv.name,template:argv.template,language:"Java/Groovy"},function(returnData){
            console.log("Project with id: "+returnData[0]._id+"  was created.");
            process.exit(0);
        });
    });
});

