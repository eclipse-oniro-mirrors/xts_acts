import webSocket from '@ohos.net.webSocket';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep (time:number):Promise<string>{
  return new Promise<string>((resolve)=>{
    setTimeout(()=>{
      resolve('ok')},time)
  });
}

class OutValue {
  status: number = 0
  message: string = ""
}

let current_url: string = 'wss://whale.tooly.top/ws';
let URLARRAY:Array<string> =
  ['wss://whale.tooly.top/ws','wss://echo.websocket.events','wss://ws.ifelse.io/','ws://echo.websocket.org'];
let caseName: string = 'Search URL ';
let ws : webSocket.WebSocket;
let websiteIndex = -1;
let isNetSuccess = 0;

let  testWsAbility:() => void = async ()=>{
  try {
    ws.on('open', (err: BusinessError, value: Object) => {
      console.info(`${caseName} : ${URLARRAY[websiteIndex]}   onopen err is ${JSON.stringify(err)} , and value is ${JSON.stringify(value)}`);
      const status: number = (value as OutValue).status;
      if(status == 101){
        isNetSuccess = 1;
        current_url = URLARRAY[websiteIndex]
      }
    });
    ws.connect(URLARRAY[websiteIndex], (err: BusinessError, value: boolean) => {
      console.info(`${caseName} :connect start execute url is  ${URLARRAY[websiteIndex]}`)
      if (err) {
        console.info(`${caseName} : ${URLARRAY[websiteIndex]} test connect fail ${JSON.stringify(err)}`);
      } else {
        console.info(`${caseName} : ${URLARRAY[websiteIndex]} test connect success and value is ${value}`);
      }
    })
    await sleep(2000);
  }catch (err){
    console.error('network search failed,err in'+JSON.stringify(err));
  }
}

let  getWebsite:() => Promise<string> = async (): Promise<string> =>{
  try {
    while(isNetSuccess == 0 && websiteIndex < URLARRAY.length - 1){
      ws = webSocket.createWebSocket();
      websiteIndex+=1;
      await testWsAbility();
    }
    console.log(caseName+" return url is"+current_url)
    return current_url;
  }catch (err){
    console.error(caseName+' getWebsite failed,err in'+JSON.stringify(err));
    return current_url;
  }
}

export default getWebsite;
