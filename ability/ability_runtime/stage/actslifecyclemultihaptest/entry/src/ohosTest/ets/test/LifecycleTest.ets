/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEvent from '@ohos.commonEventManager';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import ability from '@ohos.ability.ability';
import base from '@ohos.base';

let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');


let TAG = 'AbilityTest';
let intervalId:number = -1;
let subscriber:commonEvent.CommonEventSubscriber;

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function handlerMessage(callback:(str:string)=>void) :number{
  if (intervalId != -1) {
    clearInterval(intervalId);
  }
  intervalId = setInterval(()=>{
    let event:string[] = globalThis.testEvent;
    globalThis.testEvent = [];
    if (event && event.length > 0) {
      event.forEach(str => {
        callback(str);
      })
    }
  }, 100);
  return intervalId;
}

function handlerMessageDelayed(event: string, longTime:number) :void{
  if (event == undefined || event === '') {
    return;
  }
  if (longTime == 0) {
    globalThis.testEvent.push(event);
    return;
  }
  setTimeout(()=>{
    globalThis.testEvent.push(event);
  }, longTime);
}

export default function abilityTest() {

  describe('AbilityTest', ()=> {

    console.info("-----------------LifecycleTest is start----------------")

    beforeAll(()=>{
      let actsEvents = [
        'Hap2MainAbility10onForeground',
        'Hap3MainAbility3onForeground',
        'Hap3MainAbility2onDestroy',
        'Hap2MainAbility3onDestroy',
        'Hap2MainAbility4onDestroy',
        'Hap2MainAbility5onDestroy',
        'Hap2MainAbility7onDestroy',
        'Hap2MainAbility8onForeground',
        'Hap2MainAbility9onDestroy'
      ]
      commonEvent.createSubscriber({ events: actsEvents }).then((data)=>{
        subscriber = data;
        commonEvent.subscribe(data, (err, data)=>{
          console.info(TAG + ' subscribeCallBack. Data: ' + JSON.stringify(data));
          if (data.event == 'Hap2MainAbility10onForeground') {
            globalThis.testEvent.push('Hap2MainAbility10onForeground');
          }
          if (data.event == 'Hap3MainAbility3onForeground') {
            globalThis.testEvent.push('Hap3MainAbility3onForeground');
          }
          if (data.event == 'Hap3MainAbility2onDestroy') {
            globalThis.testEvent.push('Hap3MainAbility2onDestroy');
          }
          if (data.event == 'Hap2MainAbility3onDestroy') {
            globalThis.testEvent.push('Hap2MainAbility3onDestroy');
          }
          if (data.event == 'Hap2MainAbility4onDestroy') {
            globalThis.testEvent.push('Hap2MainAbility4onDestroy');
          }
          if (data.event == 'Hap2MainAbility5onDestroy') {
            globalThis.testEvent.push('Hap2MainAbility5onDestroy');
          }
          if (data.event == 'Hap2MainAbility7onDestroy') {
            globalThis.testEvent.push('Hap2MainAbility7onDestroy');
          }
          if (data.event == 'Hap2MainAbility8onForeground') {
            globalThis.testEvent.push('Hap2MainAbility8onForeground');
          }
          if (data.event == 'Hap2MainAbility9onDestroy') {
            globalThis.testEvent.push('Hap2MainAbility9onDestroy');
          }
        });
      })
    })

    afterAll(()=>{
      if (subscriber) {
        commonEvent.unsubscribe(subscriber)
      }
    })

    beforeEach(async (done:Function) => {
      console.info('LifeCycleTest before each called');
      await sleep(1000);
      done()
    });

    afterEach(async (done:Function) => {
      console.info(TAG + ' LifeCycleTest after each called');
      if (!("Multihap_LifecycleTest_007" == TAG ||
        "Multihap_LifecycleTest_011" == TAG ||
        "Multihap_LifecycleTest_006" == TAG)) {
        console.info(TAG + ' LifeCycleTest in after each terminateSelfwithresult MainAbility4');
        let eventCallback =(event: string)=>{
          console.log(TAG + " eventCallback, event is :" + event);
          if (event === 'MainAbility4onDestroy') {
            clearInterval(intervalId);
            done()
          }
        }
        handlerMessage(eventCallback);
        let para:ability.AbilityResult = {
          resultCode: 2,
          want: {
            "abilityName": "MainAbility4",
            bundleName: "com.example.lifecycletest"
          }
        }
        console.log("LifeCycleTest terminateSelfwithresult para: " + JSON.stringify(para));
        await globalThis.ability4context.terminateSelfWithResult(para)
          .then(() => {
            console.log("LifeCycleTest terminateSelfwithresult successful");
          }).catch((error:base.BusinessError) => {
            console.log("LifeCycleTest terminateSelfwithresult error: " + JSON.stringify(error));
          });
      } else {
        setTimeout(()=>{
          done()
        }, 1000)
      }
    });



    /**
     * @tc.name   Multihap_LifecycleTest_001
     * @tc.number Multihap_LifecycleTest_001
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Multihap_LifecycleTest_001", Level.LEVEL0, async (done:Function) => {
      console.info("---------------Multihap_LifecycleTest_001 is start---------------")
      TAG = "Multihap_LifecycleTest_001";
      let isSecondOnForegroundCount:boolean = false;
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility4onForeground') {
          if (!isSecondOnForegroundCount) {
            isSecondOnForegroundCount = true;
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility3"
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": Hap2MainAbility3 startAbility success, err: " + JSON.stringify(error));
            })
          }
        } else if (event === 'Hap2MainAbility3onDestroy'){
          clearInterval(intervalId);
          let listTemp = JSON.stringify(globalThis.mainAbility4ListKey);
          console.log(TAG + "listTemp is :" + listTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listTemp.indexOf("Hap2MainAbility3 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility3 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility3 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility3 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility3 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility3 onAbilityDestroy") !== -1).assertTrue();
          console.info(TAG + "globalThis.ApplicationContext4 is :" + JSON.stringify(globalThis.ApplicationContext4));
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
            });
          done();
        }
      }
      handlerMessage(eventCallback);
      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error:base.BusinessError, data:ESObject) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      console.info("---------------Multihap_LifecycleTest_001 is end---------------")
    });

    /**
     * @tc.name   Multihap_LifecycleTest_002
     * @tc.number Multihap_LifecycleTest_002
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Multihap_LifecycleTest_002", Level.LEVEL0, async (done:Function) => {
      console.log("------------Multihap_LifecycleTest_002 start-------------");
      TAG = "Multihap_LifecycleTest_002";
      let isSecondOnForegroundCount:boolean = false;
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility4onForeground') {
          if (!isSecondOnForegroundCount) {
            isSecondOnForegroundCount = true;
            handlerMessageDelayed('StartHap2MainAbility4', 0);
            handlerMessageDelayed('StartHap2MainAbility4', 1000);
          }
        }else if (event === 'StartHap2MainAbility4'){
          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "Hap2MainAbility4"
          }, (error:base.BusinessError, data:ESObject) => {
            console.log(TAG + ":first Hap2MainAbility4 startAbility success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });
        } else if (event === 'Hap2MainAbility4onDestroy'){
          clearInterval(intervalId);
          let listTemp = JSON.stringify(globalThis.mainAbility4ListKey);
          console.log(TAG + "listTemp is :" + listTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listTemp.indexOf("Hap2MainAbility4 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility4 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility4 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility4 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility4 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility4 onAbilityDestroy") !== -1).assertTrue();
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
            });
          done();
        }
      }
      handlerMessage(eventCallback);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error:base.BusinessError, data:ESObject) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      console.log("------------Multihap_LifecycleTest_002 end-------------");
    });

    /**
     * @tc.name   Multihap_LifecycleTest_003
     * @tc.number Multihap_LifecycleTest_003
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Multihap_LifecycleTest_003", Level.LEVEL0, async (done:Function) => {
      console.log("------------Multihap_LifecycleTest_003 start-------------");
      TAG = "Multihap_LifecycleTest_003";
      let isSecondOnForegroundCount:boolean = false;
      let hap2MainAbility5Count = 0;
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility4onForeground') {
          if (!isSecondOnForegroundCount) {
            isSecondOnForegroundCount = true;
            handlerMessageDelayed('StartHap2MainAbility5', 0);
            handlerMessageDelayed('StartHap2MainAbility5', 1000);
          }
        }else if (event === 'StartHap2MainAbility5'){
          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "Hap2MainAbility5"
          }, (error:base.BusinessError, data:ESObject) => {
            console.log(TAG + ": Hap2MainAbility5 startAbility success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });
        } else if (event === 'Hap2MainAbility5onDestroy'){
          hap2MainAbility5Count ++;
          if (hap2MainAbility5Count === 1) {
            return;
          }
          let listTemp = JSON.stringify(globalThis.mainAbility4ListKey);
          console.log(TAG + "listTemp is :" + listTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listTemp.split("Hap2MainAbility5 onAbilityCreate").length - 1).assertEqual(2);
          expect(listTemp.split("Hap2MainAbility5 onWindowStageCreate").length - 1).assertEqual(2);
          expect(listTemp.split("Hap2MainAbility5 onAbilityForeground").length - 1).assertEqual(2);
          expect(listTemp.split("Hap2MainAbility5 onAbilityBackground").length - 1).assertEqual(2);
          expect(listTemp.split("Hap2MainAbility5 onWindowStageDestroy").length - 1).assertEqual(2);
          expect(listTemp.split("Hap2MainAbility5 onAbilityDestroy").length - 1).assertEqual(2);
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
            });
          clearInterval(intervalId);
          done();
        }
      }
      handlerMessage(eventCallback);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error:base.BusinessError, data:ESObject) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      console.log("------------Multihap_LifecycleTest_003 end-------------");
    });

    /**
     * @tc.name   Multihap_LifecycleTest_004
     * @tc.number Multihap_LifecycleTest_004
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Multihap_LifecycleTest_004", Level.LEVEL0, async (done:Function) => {
      console.log("------------Multihap_LifecycleTest_004 start-------------");
      TAG = "Multihap_LifecycleTest_004";
      let isStartedHap2MainAbility6:boolean = false;
      let isStartedHap3MainAbility2:boolean = false;
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility4onForeground') {
          if (!isStartedHap2MainAbility6) {
            isStartedHap2MainAbility6 = true;
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility6"
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ":first Hap2MainAbility6 startAbility success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            });
          } else if (!isStartedHap3MainAbility2) {
            isStartedHap3MainAbility2 = true;
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap3MainAbility2"
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": second Hap3MainAbility2 startAbility success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            })
          }
        } else if (event === 'Hap3MainAbility2onDestroy'){
          clearInterval(intervalId);
          let listTemp = JSON.stringify(globalThis.mainAbility4ListKey);
          console.log(TAG + "listTemp is :" + listTemp);
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listTemp.indexOf("Hap2MainAbility6 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onAbilityDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap3MainAbility2 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap3MainAbility2 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap3MainAbility2 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap3MainAbility2 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap3MainAbility2 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap3MainAbility2 onAbilityDestroy") !== -1).assertTrue();
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
            });
          done();
        }
      }
      handlerMessage(eventCallback);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error:base.BusinessError, data:ESObject) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      console.log("------------Multihap_LifecycleTest_004 end-------------");
    });

    /**
     * @tc.name   Multihap_LifecycleTest_005
     * @tc.number Multihap_LifecycleTest_005
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Multihap_LifecycleTest_005", Level.LEVEL0, async (done:Function) => {
      console.log("------------Multihap_LifecycleTest_005 start-------------");
      TAG = "Multihap_LifecycleTest_005";
      let isStartedHap2MainAbility6:boolean = false;
      let isStartedHap2MainAbility7:boolean = false;
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility4onForeground') {
          if (!isStartedHap2MainAbility6) {
            isStartedHap2MainAbility6 = true;
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility6"
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ":first Hap2MainAbility6 startAbility success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            });
          } else if (!isStartedHap2MainAbility7) {
            isStartedHap2MainAbility7 = true;
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility7"
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": second Hap2MainAbility7 startAbility success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            })
          }
        } else if (event === 'Hap2MainAbility7onDestroy'){
          let listTemp = JSON.stringify(globalThis.mainAbility4ListKey);
          console.log(`${TAG} listTemp is: ${listTemp}`)
          console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
          expect(listTemp.indexOf("Hap2MainAbility6 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility6 onAbilityDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility7 onAbilityCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility7 onWindowStageCreate") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility7 onAbilityForeground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility7 onAbilityBackground") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility7 onWindowStageDestroy") !== -1).assertTrue();
          expect(listTemp.indexOf("Hap2MainAbility7 onAbilityDestroy") !== -1).assertTrue();
          globalThis.ApplicationContext4
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);

            });
          clearInterval(intervalId);
          done();
        }
      }
      handlerMessage(eventCallback);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4"
      }, (error:base.BusinessError, data:ESObject) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      console.log("------------end Multihap_LifecycleTest_005-------------");
    });

    /**
     * @tc.name   Multihap_LifecycleTest_006
     * @tc.number Multihap_LifecycleTest_006
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Multihap_LifecycleTest_006", Level.LEVEL0, async (done:Function) => {
      console.log("------------Multihap_LifecycleTest_006 start-------------");
      TAG = "Multihap_LifecycleTest_006";
      let isOneStartedHap2MainAbility8:boolean = false;
      let ids:Array<number> = []
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility7onForeground') {
          console.log(TAG + "MainAbility7 is onForeground, callBackId is :" + globalThis.mainAbility7CallBackId);
          ids.push(globalThis.mainAbility7CallBackId);
          if (isOneStartedHap2MainAbility8) {
            console.log(TAG + " ids is :" + JSON.stringify(ids));
            clearInterval(intervalId);
            if (ids.length < 2) {
              expect().assertFail()
            } else {
              expect(ids[1]).assertEqual(ids[0] + 1);
            }
            ids.forEach(id => {
              globalThis.ApplicationContext7.unregisterAbilityLifecycleCallback(id);
            })
            
            commonEvent.publish('Hap2MainAbility8doTerminateSelf', (err) => {
              console.log('Hap2MainAbility8doTerminateSelf');
              globalThis.ability7context.terminateSelf(()=>{
                done();
              });
            })
          } else {
            isOneStartedHap2MainAbility8 = true;
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility8"
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": first Hap2MainAbility8 startAbility success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            });
          }
        } else if (event === 'Hap2MainAbility8onForeground') {
          if (deviceSupport === 'false') {
            done();
            return;
          }
          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "MainAbility7"
          }, (error:base.BusinessError, data:ESObject) => {
            console.log(TAG + ": second MainAbility7 startAbility success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });
        }
      }
      handlerMessage(eventCallback);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility7"
      }, (error:base.BusinessError, data:ESObject) => {
        console.log(TAG + ": first MainAbility7 startAbility success, err: " + JSON.stringify(error) +
        ",data: " + JSON.stringify(data));
      });
      console.log("------------Multihap_LifecycleTest_006 end-------------");
    });

    /**
     * @tc.name   Multihap_LifecycleTest_007
     * @tc.number Multihap_LifecycleTest_007
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Multihap_LifecycleTest_007", Level.LEVEL0, async (done:Function) => {
      console.log("------------Multihap_LifecycleTest_007 start-------------");
      TAG = "Multihap_LifecycleTest_007";
      let isMainAbility6SecondOnForeground:boolean = false;
      let callBackId1 = -1;
      let callBackId2 = -1;
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility6') {
          isMainAbility6SecondOnForeground = false;
          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "MainAbility6"
          }, (error:base.BusinessError, data:ESObject) => {
            console.log(TAG + ": MainAbility6 startAbility success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });
        } else if (event === 'MainAbility6onForeground'){
          if (!isMainAbility6SecondOnForeground) {
            globalThis.abilityContext6.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility9"
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": Hap2MainAbility9 startAbility success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
            });
          }
          isMainAbility6SecondOnForeground = true;
        } else if (event === 'MainAbility6onDestroy'){
          if (callBackId2 == -1) {
            handlerMessageDelayed('StartMainAbility6', 0)
          }
        } else if (event === 'Hap2MainAbility9onDestroy') {
          if (callBackId1 == -1) {
            let listTemp = JSON.stringify(globalThis.mainAbility6ListKey);
            console.log(TAG + "listTemp is :" + listTemp);
            console.log(TAG + "first globalThis.mainAbility6CallBackId is :" + globalThis.mainAbility6CallBackId);
            callBackId1 = globalThis.mainAbility6CallBackId;
            console.log(TAG + "callBackId1 is :" + callBackId1);
            expect(listTemp.indexOf("Hap2MainAbility9 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility9 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility9 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility9 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility9 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility9 onAbilityDestroy") !== -1).assertTrue();
            globalThis.ApplicationContext6
              .unregisterAbilityLifecycleCallback(callBackId1,(error:base.BusinessError, data:ESObject) => {
                console.log(TAG + ": first unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                if (error.code == 0) {
                  globalThis.abilityContext6.terminateSelf()
                } else {
                  clearInterval(intervalId);
                  done()
                }
              });
          } else {
            clearInterval(intervalId);
            let listTemp1 = JSON.stringify(globalThis.mainAbility6ListKey);
            console.log(TAG + "listTemp1 is :" + listTemp1);
            console.log(TAG + "second globalThis.mainAbility6CallBackId is :" + globalThis.mainAbility6CallBackId);
            callBackId2 = globalThis.mainAbility6CallBackId
            console.log(TAG + "callBackId2 is :" + callBackId2);
            expect(callBackId2).assertEqual(callBackId1 + 1);
            expect(listTemp1.indexOf("Hap2MainAbility9 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp1.indexOf("Hap2MainAbility9 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp1.indexOf("Hap2MainAbility9 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp1.indexOf("Hap2MainAbility9 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp1.indexOf("Hap2MainAbility9 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp1.indexOf("Hap2MainAbility9 onAbilityDestroy") !== -1).assertTrue()
            globalThis.ApplicationContext6
              .unregisterAbilityLifecycleCallback(callBackId2,(error:base.BusinessError, data:ESObject) => {
                console.log(TAG + ": second unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                globalThis.abilityContext6.terminateSelf()
                done();
              });
          }
        }
      }
      handlerMessage(eventCallback);
      handlerMessageDelayed('StartMainAbility6', 1000)
      console.log("------------Multihap_LifecycleTest_007 end-------------");
    });

    /**
     * @tc.name   Multihap_LifecycleTest_008
     * @tc.number Multihap_LifecycleTest_008
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Multihap_LifecycleTest_008", Level.LEVEL0, async (done:Function) => {
      console.log("------------Multihap_LifecycleTest_008 start-------------");
      TAG = "Multihap_LifecycleTest_008";

      let isSecondMainAbility4onForeground = false;
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'StartMainAbility4') {
          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "MainAbility4"
          }, (error:base.BusinessError, data:ESObject) => {
            console.log(TAG + ": MainAbility4 startAbility success, err: " + JSON.stringify(error) +
            ",data: " + JSON.stringify(data));
          });
        } else if (event === 'MainAbility4onForeground'){
          if (isSecondMainAbility4onForeground) {
            clearInterval(intervalId);
            let listTemp = JSON.stringify(globalThis.mainAbility4ListKey);
            console.log(TAG + "listTemp is :" + listTemp);
            console.log(TAG + "globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
            expect(listTemp.indexOf("Hap2MainAbility6 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility6 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility6 onAbilityForeground") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility6 onAbilityBackground") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility6 onWindowStageDestroy") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility6 onAbilityDestroy") !== -1).assertTrue();
            globalThis.ApplicationContext4
              .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error:base.BusinessError, data:ESObject) => {
                console.log(TAG + ": first unregisterAbilityLifecycleCallback, err: " + JSON.stringify(error) +
                ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                globalThis.ApplicationContext4
                  .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId,(error:base.BusinessError, data:ESObject) => {
                    console.log(TAG + ": second unregisterAbilityLifecycleCallback, err: " + JSON.stringify(error) +
                    ",data: " + JSON.stringify(data));
                    expect(error.code).assertEqual(1);
                    done()
                  });
              });
          } else {
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility6"
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": Hap2MainAbility6 startAbility success, err: " +
              JSON.stringify(error) + ",data: " + JSON.stringify(data));
            })
          }
          isSecondMainAbility4onForeground = true;
        }
      }
      handlerMessage(eventCallback);
      handlerMessageDelayed('StartMainAbility4', 1000)
      console.log("------------Multihap_LifecycleTest_008 end-------------");
    });

    /**
     * @tc.name   Multihap_LifecycleTest_010
     * @tc.number Multihap_LifecycleTest_010
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multihap_LifecycleTest_010', Level.LEVEL0, async (done:Function) => {
      console.info("---------------Multihap_LifecycleTest_010 is start---------------")
      TAG = "Multihap_LifecycleTest_010";
      let hap3MainAbility3onForegroundCount:number = 0;
      let isFirstMainAbility4onForeground = true;
      let eventCallback =  async (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility4onForeground' && isFirstMainAbility4onForeground){
          await sleep(1000);
          isFirstMainAbility4onForeground = false;
          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "Hap2MainAbility10",
          }, (error:base.BusinessError, data:ESObject) => {
            console.log(TAG + ": first Hap2MainAbility10 startAbility success, err: " +
            JSON.stringify(error) + ",data: " + JSON.stringify(data));
          })
        } else if (event === 'Hap2MainAbility10onForeground') {
          await sleep(1000);
          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "Hap3MainAbility3",
          }, (error:base.BusinessError, data:ESObject) => {
            console.log(TAG + ": second Hap3MainAbility3 startAbility success, err: " +
            JSON.stringify(error) + ",data: " + JSON.stringify(data));
          })
        } else if (event === 'Hap3MainAbility3onForeground') {
          if (deviceSupport === 'false') {
            done();
            return;
          }
          await sleep(1000);
          hap3MainAbility3onForegroundCount ++;
          if (hap3MainAbility3onForegroundCount == 3) {
            clearInterval(intervalId);
            let listTemp = JSON.stringify(globalThis.mainAbility4ListKey);
            console.log(TAG + " listTemp is :" + listTemp);
            console.log(TAG + " globalThis.mainAbility4CallBackId is :" + globalThis.mainAbility4CallBackId);
            expect(listTemp.indexOf("Hap2MainAbility10 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap2MainAbility10 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.split("Hap2MainAbility10 onAbilityForeground").length - 1).assertEqual(3);
            expect(listTemp.split("Hap2MainAbility10 onAbilityBackground").length - 1).assertEqual(3);
            expect(listTemp.indexOf("Hap3MainAbility3 onAbilityCreate") !== -1).assertTrue();
            expect(listTemp.indexOf("Hap3MainAbility3 onWindowStageCreate") !== -1).assertTrue();
            expect(listTemp.split("Hap3MainAbility3 onAbilityForeground").length - 1).assertEqual(3);
            expect(listTemp.split("Hap3MainAbility3 onAbilityBackground").length - 1).assertEqual(2);

            globalThis.ApplicationContext4
              .unregisterAbilityLifecycleCallback(globalThis.mainAbility4CallBackId, (error:base.BusinessError, data:ESObject) => {
                console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
                ",data: " + JSON.stringify(data));
                expect(error.code).assertEqual(0);
                globalThis.abilityContext.startAbility({
                  bundleName: "com.example.lifecycletest",
                  abilityName: "com.example.lifecycletest.MainAbility",
                }, (error:base.BusinessError, data:ESObject) => {
                  console.log(TAG + ": first Hap2MainAbility10 startAbility success, err: " +
                  JSON.stringify(error) + ",data: " + JSON.stringify(data));
                })
                done();
              });
          } else {
            await sleep(1000);
            globalThis.abilityContext.startAbility({
              bundleName: "com.example.lifecycletest",
              abilityName: "Hap2MainAbility10",
            }, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": first Hap2MainAbility10 startAbility success, err: " +
              JSON.stringify(error) + ",data: " + JSON.stringify(data));
            })
          }
        }
      }
      handlerMessage(eventCallback);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility4",
      }, (error:base.BusinessError, data:ESObject) => {
        console.log(TAG + ": MainAbility4 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })
      console.info("---------------Multihap_LifecycleTest_010 is end---------------")
    })

    /**
     * @tc.name   Multihap_LifecycleTest_011
     * @tc.number Multihap_LifecycleTest_011
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Multihap_LifecycleTest_011', Level.LEVEL0, async (done:Function) => {
      console.info("---------------Multihap_LifecycleTest_011 is start---------------")
      TAG = "Multihap_LifecycleTest_011";
      let listKeyTemp: Array<string> = [];
      let eventCallback =  (event: string)=>{
        console.log(TAG + " eventCallback, event is :" + event);
        if (event === 'MainAbility2onForeground'){
          globalThis.abilityContext.startAbility({
            bundleName: "com.example.lifecycletest",
            abilityName: "Hap4MainAbility1",
          }, (error:base.BusinessError, data:ESObject) => {
            console.log(TAG + ": Hap4MainAbility1 startAbility result, err: " +
            JSON.stringify(error) + ",data: " + JSON.stringify(data));
            handlerMessageDelayed('doAssert', 1000)
          });
        } else if (event === 'doAssert') {
          clearInterval(intervalId)
          for (let i = 0; i < globalThis.mainAbility2ListKey.length; i++) {
            if (globalThis.mainAbility2ListKey[i].substring(0, 16) == "Hap4MainAbility1") {
              listKeyTemp.push(globalThis.mainAbility2ListKey[i] as string);
            }
          }
          console.log(TAG + " listKeyTemp is :" + listKeyTemp);
          console.log(TAG + " globalThis.mainAbility2CallBackId is :" + globalThis.mainAbility2CallBackId);
          expect(listKeyTemp.length).assertEqual(0);

          globalThis.ApplicationContext2
            .unregisterAbilityLifecycleCallback(globalThis.mainAbility2CallBackId, (error:base.BusinessError, data:ESObject) => {
              console.log(TAG + ": unregisterAbilityLifecycleCallback success, err: " + JSON.stringify(error) +
              ",data: " + JSON.stringify(data));
              expect(error.code).assertEqual(0);
              done();
            });
        }
      }
      handlerMessage(eventCallback);

      globalThis.abilityContext.startAbility({
        bundleName: "com.example.lifecycletest",
        abilityName: "MainAbility2",
      }, (error:base.BusinessError, data:ESObject) => {
        console.log(TAG + ": Hap1MainAbility2 startAbility success, err: " +
        JSON.stringify(error) + ",data: " + JSON.stringify(data));
      })

      await sleep(500);
      console.info("---------------Multihap_LifecycleTest_011 is end---------------")
    })
  })
}