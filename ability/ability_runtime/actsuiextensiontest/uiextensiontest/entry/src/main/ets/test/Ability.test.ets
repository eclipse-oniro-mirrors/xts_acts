/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import common from '@ohos.app.ability.common'
import commonEventManager from '@ohos.commonEventManager'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import router from '@ohos.router'
import Utils from './Utils'

export default function abilityTest() {

  describe('ACTS_UIExtension', function () {
    let context = getContext(this) as common.UIAbilityContext;
    let TAG = "";
    let sleepTimeOne = 1000;
    let globalscribe = undefined
    let globalId = 0
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(function () {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async function (done) {
      console.info("ACTS_UIExtension beforeEach start");
      let options = {
        url: 'TestAbility/pages/p1',
      }
      let result;
      try {
        result = await router.pushUrl(options);
        await Utils.sleep(500);
        console.info("ACTS_UIExtension push page result: " + JSON.stringify(result));
      } catch (err) {
        console.error("ACTS_UIExtension push page error: " + err);
      }
      globalId +=1;
      let id = globalId;
      console.log("start globalId="+globalId);
      setTimeout(async () => {
        console.log("id ="+id + "globalId="+globalId);
        if(id == globalId){
          console.log("unsubscribe start"+globalscribe + "globalId="+globalId);
          Utils.unsubscribe(globalscribe)
          console.log("unsubscribe done"+globalscribe + "globalId="+globalId);
          expect().assertFail();
          done()
        }
      }, 8000); // max wait 8s
      setTimeout(async () => {
        done()
      }, 300);
    });
    afterEach(async function (done) {
      console.log("done globalId="+globalId);
      Utils.unsubscribe(globalscribe)
      router.back()
      await Utils.sleep(500);
      done()
    })
    afterAll(function () {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('ACTS_UIExtension_TerminateSelfWithResult_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_TerminateSelfWithResult_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_OnResult';
      let terminateSelfWithResultEvent = 'ACTS_UIExtension_TerminateSelfWithResult';
      var subscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(terminateSelfWithResultEvent, (err) => {
              if (err) {
                console.log(TAG + `publish ACTS_UIExtension_TerminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish ACTS_UIExtension_TerminateSelfWithResult success');
              }
            });
          } else if (data.event == onResultEvent) {
            let result = data.parameters.result;
            expect(result.want.bundleName).assertEqual('test');
            done();
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_ConnectAbility_001
     * @tc.name    : UIExtension connect serviceAbility
     * @tc.desc    : test UIExtension connectServiceExtensionAbility api
     */
    it('ACTS_UIExtension_ConnectAbility_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_ConnectAbility_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successConnectEvent = 'ACTS_UIExtension_SuccessConnect';
      let successConnectEvent2 = 'ACTS_UIExtension_SuccessConnect2';
      let failConnectEvent = 'ACTS_UIExtension_FailConnect';
      let connectAbilityEvent = 'ACTS_UIExtension_ConnectAbility';
      let conn = false;
      let disconn = false;
      var subscribeInfo = {
        events: [appearEvent, successConnectEvent,failConnectEvent,successConnectEvent2]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(connectAbilityEvent, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successConnectEvent) {
            conn = true
            console.info("___" + conn + " "+ disconn )
            if(disconn == true){
              done()
            }
          } else if (data.event == successConnectEvent2) {
            disconn = true
            console.info("___" + conn + " "+ disconn )
            if(conn == true){
              done()
            }
          }else if (data.event == failConnectEvent) {
            console.log(TAG + "connectAbility fail");
            expect().assertFail();
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_MoreParamater_001
     * @tc.name    : UIExtension Connect MoreParamater
     * @tc.desc    : test UIExtension connect and disconnect serviceAbility with more paramater
     */
    it('ACTS_UIExtension_MoreParamater_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_MoreParamater_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successConnectMoreParamater = 'ACTS_UIExtension_Connect_More_Paramater';
      let successDisconnectMoreParamater = 'ACTS_UIExtension_Disconnect_More_Paramater';
      let MoreParamaterEvent = 'ACTS_UIExtension_MoreParamaterEvent';
      let recvCount = 0;
      var subscribeInfo = {
        events: [appearEvent, successConnectMoreParamater,successDisconnectMoreParamater]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(MoreParamaterEvent, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successConnectMoreParamater) {
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }else if (data.event == successDisconnectMoreParamater) {
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_Exception_001
     * @tc.name    : UIExtension connect serviceAbility with Exception
     * @tc.desc    : test UIExtension connect serviceAbility with Exception about error paramater
     */
    it('ACTS_UIExtension_Exception_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_Exception_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successExceptionEvent = 'ACTS_UIExtension_Exception_SuccessConnect';
      let failExceptionEvent = 'ACTS_UIExtension_Exception_FailConnect';
      let connectExceptionEvent = 'ACTS_UIExtension_Exception_ConnectAbility';
      var subscribeInfo = {
        events: [appearEvent, successExceptionEvent,failExceptionEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(connectExceptionEvent, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successExceptionEvent) {
            console.log(TAG + "connectAbility success");
            done()
          }else if (data.event == failExceptionEvent) {
            console.log(TAG + "connectAbility fail");
            expect().assertFail();
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DisConnectAbility_001
     * @tc.name    : UIExtension disconnect serviceAbility
     * @tc.desc    : test UIExtension disconnectServiceExceptionAbility much example
     */
    it('ACTS_UIExtension_DisConnectAbility_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_DisConnectAbility_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDisconnectEvent = 'ACTS_UIExtension_Disconnect_Success';
      let failDisconnectEvent = 'ACTS_UIExtension_Disconnect_Fail';
      let disConnectEvent = 'ACTS_UIExtension_DisconnectAbility';
      var subscribeInfo = {
        events: [appearEvent, successDisconnectEvent,failDisconnectEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(disConnectEvent, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDisconnectEvent) {
            console.log(TAG + "connectAbility success");
            done()
          }else if (data.event == failDisconnectEvent) {
            console.log(TAG + "connectAbility fail");
            expect().assertFail();
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_SameApp_001
     * @tc.name    : UIExtension connect serviceAbility in sameApp
     * @tc.desc    : UIExtension connect serviceAbility in sameApp with callback in many example
     */
    it('ACTS_UIExtension_SameApp_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_SameApp_001 == ';
      console.log(TAG + "begin");
      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successSameAppEvent = 'ACTS_UIExtension_SameApp_Success';
      let successSameAppEvent2 = 'ACTS_UIExtension_SameApp_Success2';
      let successSameAppEvent3 = 'ACTS_UIExtension_SameApp_Success3';
      let failSameAppEvent = 'ACTS_UIExtension_SameApp_Fail';
      let sameAppEvent = 'ACTS_UIExtension_SameApp';
      let flag1 = false;
      let flag2 = false;
      let flag3 = false;
      var subscribeInfo = {
        events: [appearEvent, successSameAppEvent,failSameAppEvent,successSameAppEvent2,successSameAppEvent3]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == appearEvent) {
            commonEventManager.publish(sameAppEvent, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successSameAppEvent) {
            flag1 = true;
            console.info("___" + flag1 + " "+ flag2 + " "+flag3)
            if(flag2 && flag3){
              done()
            }
          } else if (data.event == successSameAppEvent2) {
            flag2 = true;
            console.info("___" + flag1 + " "+ flag2 + " "+flag3)
            if(flag1 && flag3){
              done()
            }
          } else if (data.event == successSameAppEvent3) {
            flag3 = true;
            console.info("___" + flag1 + " "+ flag2 + " "+flag3)
            if(flag1 && flag2){
              done()
            }
          }else if (data.event == failSameAppEvent) {
            console.log(TAG + "connectAbility fail");
            expect().assertFail();
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_001
     * @tc.name    : UIExtension connect serviceAbility and disconnect serviceAbility
     * @tc.desc    : UIExtension connect serviceAbility and disconnect serviceAbility in difference app with promise
     */
    it('ACTS_UIExtension_DifferentApp_001',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_001 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent = 'ACTS_UIExtension_DifferentApp_Success';
      let failDifferentAppEvent = 'ACTS_UIExtension_DifferentApp_Fail';
      let differentAppEvent = 'ACTS_UIExtension_DifferentApp';
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent,failDifferentAppEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent) {
            console.log(TAG + "connectAbility success");
            done()
          }else if (data.event == failDifferentAppEvent) {
            console.log(TAG + "connectAbility fail");
            expect().assertFail();
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_002
     * @tc.name    : test UIExtension in DifferentApp 002
     * @tc.desc    : UIExtension connect serviceAbility and terminal UIExtensionAbility
     */
    it('ACTS_UIExtension_DifferentApp_002',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_002 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let testServiceDestroyEvent = 'testServiceDestroyEvent';
      let differentAppEvent002 = 'ACTS_UIExtension_DifferentApp002';
      var subscribeInfo = {
        events: [appearEvent, testServiceDestroyEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent002, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == testServiceDestroyEvent) {
            console.log(TAG + "ServiceDestroy success");
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_003
     * @tc.name    : test UIExtension in DifferentApp 003
     * @tc.desc    : UIExtension connect lots of serviceAbility and terminal UIExtensionAbility
     */
    it('ACTS_UIExtension_DifferentApp_003',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_003 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let subServiceDestroyEvent = 'subServiceDestroyEvent';
      let multiServiceDestroyEvent = 'multiServiceDestroyEvent';
      let differentAppEvent003 = 'ACTS_UIExtension_DifferentApp003';
      let subRecvCount = 0;
      let multiRecvCount = 0;
      var subscribeInfo = {
        events: [appearEvent, subServiceDestroyEvent,multiServiceDestroyEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent003, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == subServiceDestroyEvent) {
            subRecvCount = 1;
            if(subRecvCount == 1 && multiRecvCount == 1){
              done()
            }
            console.log(TAG + "subServiceDestroy success");
          }else if (data.event == multiServiceDestroyEvent) {
            multiRecvCount = 1;
            if(subRecvCount == 1 && multiRecvCount == 1){
              done()
            }
            console.log(TAG + "multiServiceDestroy success");
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_004
     * @tc.name    : test UIExtension in DifferentApp 004
     * @tc.desc    : UIExtension connect serviceAbility and terminal service
     */
    it('ACTS_UIExtension_DifferentApp_004',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_004 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent004 = 'ACTS_UIExtension_DifferentApp004_Success';
      let differentAppEvent004 = 'ACTS_UIExtension_DifferentApp004';
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent004]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent004, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent004) {
            console.log(TAG + "ServiceDestroy success");
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_005
     * @tc.name    : test UIExtension in DifferentApp 005
     * @tc.desc    : UIExtension connect service1, servce1 connect service2, disconnect by self
     */
    it('ACTS_UIExtension_DifferentApp_005',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_005 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent005 = 'ACTS_UIExtension_DifferentApp005_Success';
      let differentAppEvent005 = 'ACTS_UIExtension_DifferentApp005';
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent005]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent005, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent005) {
            console.log(TAG + "ServiceDestroy success");
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_006
     * @tc.name    : test UIExtension in DifferentApp 006
     * @tc.desc    : UIExtension connect service visable and invisible with no Permission in foreground
     */
    it('ACTS_UIExtension_DifferentApp_006',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_006 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent006_visible = 'ACTS_UIExtension_DifferentApp006_visibleSuccess';
      let successDifferentAppEvent006_unvisible = 'ACTS_UIExtension_DifferentApp006_unvisibleSuccess';
      let differentAppEvent006 = 'ACTS_UIExtension_DifferentApp006';
      let recvCount = 0;
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent006_visible,successDifferentAppEvent006_unvisible]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent006, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent006_visible) {
            console.log(TAG + "ServiceDestroy success");
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }else if (data.event == successDifferentAppEvent006_unvisible) {
            console.log(TAG + "ServiceDestroy success");
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

     /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_007
     * @tc.name    : test UIExtension in DifferentApp 007
     * @tc.desc    : UIExtension connect service visable and invisible with START_ABILITY_ABILITY Permission  in foreground
     */   
    it('ACTS_UIExtension_DifferentApp_007',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_007 == ';
      console.log(TAG + "begin");
      router.back()  
      await Utils.sleep(500);
      let options = {
        url: 'TestAbility/pages/p2',
      }
      let result;
      try {
        result = await router.pushUrl(options);
        await Utils.sleep(500);
        console.info("ACTS_UIExtension push page result: " + JSON.stringify(result));
      } catch (err) {
        console.error("ACTS_UIExtension push page error: " + err);
      }

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent007_visible = 'ACTS_UIExtension_DifferentApp007_visibleSuccess';
      let successDifferentAppEvent007_unvisible = 'ACTS_UIExtension_DifferentApp007_unvisibleSuccess';
      let differentAppEvent007 = 'ACTS_UIExtension_DifferentApp007';
      let recvCount = 0;
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent007_visible,successDifferentAppEvent007_unvisible]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent007, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent007_visible) {
            console.log(TAG + "ServiceDestroy success");
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }else if (data.event == successDifferentAppEvent007_unvisible) {
            console.log(TAG + "ServiceDestroy success");
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_008
     * @tc.name    : test UIExtension in DifferentApp 008
     * @tc.desc    : UIExtension connect service visable and invisible with no Permission  in background
     */   
    it('ACTS_UIExtension_DifferentApp_008',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_008 == ';
      console.log(TAG + "begin");

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent008_visible = 'ACTS_UIExtension_DifferentApp008_visibleSuccess';
      let successDifferentAppEvent008_unvisible = 'ACTS_UIExtension_DifferentApp008_unvisibleSuccess';
      let differentAppEvent008 = 'ACTS_UIExtension_DifferentApp008';
      let recvCount = 0;
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent008_visible,successDifferentAppEvent008_unvisible]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent008, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent008_visible) {
            console.log(TAG + "ServiceDestroy success");
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }else if (data.event == successDifferentAppEvent008_unvisible) {
            console.log(TAG + "ServiceDestroy success");
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_009
     * @tc.name    : test UIExtension in DifferentApp 009
     * @tc.desc    : UIExtension connect service visable and invisible with START_ABILITY_ABILITY Permission in background
     */      
    it('ACTS_UIExtension_DifferentApp_009',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_009 == ';
      console.log(TAG + "begin");

      router.back() 
      await Utils.sleep(500);
      let options = {
        url: 'TestAbility/pages/p2',
      }
      let result;
      try {
        result = await router.pushUrl(options);
        await Utils.sleep(500);
        console.info("ACTS_UIExtension push page result: " + JSON.stringify(result));
      } catch (err) {
        console.error("ACTS_UIExtension push page error: " + err);
      }

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent009_visible = 'ACTS_UIExtension_DifferentApp009_visibleSuccess';
      let successDifferentAppEvent009_unvisible = 'ACTS_UIExtension_DifferentApp009_unvisibleSuccess';
      let differentAppEvent009 = 'ACTS_UIExtension_DifferentApp009';
      let recvCount = 0;
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent009_visible,successDifferentAppEvent009_unvisible]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent009, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent009_visible) {
            console.log(TAG + "ServiceDestroy success");
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }else if (data.event == successDifferentAppEvent009_unvisible) {
            console.log(TAG + "ServiceDestroy success");
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_010
     * @tc.name    : test UIExtension in DifferentApp 010
     * @tc.desc    : different UIExtension connect same service
     */      
    it('ACTS_UIExtension_DifferentApp_010',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_010 == ';
      console.log(TAG + "begin");

      router.back() 
      await Utils.sleep(500);
      let options = {
        url: 'TestAbility/pages/p3',
      }
      let result;
      try {
        result = await router.pushUrl(options);
        await Utils.sleep(500);
        console.info("ACTS_UIExtension push page result: " + JSON.stringify(result));
      } catch (err) {
        console.error("ACTS_UIExtension push page error: " + err);
      }

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent010_ext1 = 'ACTS_UIExtension_DifferentApp010_ext1_Success';
      let successDifferentAppEvent010_ext2 = 'ACTS_UIExtension_DifferentApp010_ext2_Success';
      let differentAppEvent010 = 'ACTS_UIExtension_DifferentApp010';
      let recvCount = 0;
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent010_ext1,successDifferentAppEvent010_ext2]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent010, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent010_ext1) {
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }else if (data.event == successDifferentAppEvent010_ext2) {
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_DifferentApp_011
     * @tc.name    : test UIExtension in DifferentApp 011
     * @tc.desc    : UIExtension connect service visable and invisible with START_ABILITY_ABILITY and START_ABILITIES_FROM_BACKGROUND Permission in background
     */      
    it('ACTS_UIExtension_DifferentApp_011',0, async function (done) {
      TAG = 'ACTS_UIExtension_DifferentApp_011 == ';
      console.log(TAG + "begin");

      router.back() 
      await Utils.sleep(500);
      let options = {
        url: 'TestAbility/pages/p4',
      }
      let result;
      try {
        result = await router.pushUrl(options);
        await Utils.sleep(500);
        console.info("ACTS_UIExtension push page result: " + JSON.stringify(result));
      } catch (err) {
        console.error("ACTS_UIExtension push page error: " + err);
      }

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successDifferentAppEvent011_visible = 'ACTS_UIExtension_DifferentApp011_visibleSuccess';
      let successDifferentAppEvent011_unvisible = 'ACTS_UIExtension_DifferentApp011_unvisibleSuccess';
      let differentAppEvent011 = 'ACTS_UIExtension_DifferentApp011';
      let recvCount = 0;
      var subscribeInfo = {
        events: [appearEvent, successDifferentAppEvent011_visible,successDifferentAppEvent011_unvisible]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;

        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(differentAppEvent011, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == successDifferentAppEvent011_visible) {
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }else if (data.event == successDifferentAppEvent011_unvisible) {
            recvCount +=1;
            if(recvCount == 2){
              done()
            }
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_Device_01
     * @tc.name    : test UIExtension back to desktop
     * @tc.desc    : UIExtension connect service successful back to desktop
     */      
    it('ACTS_UIExtension_Device_01',0, async function (done) {
      TAG = 'ACTS_UIExtension_Device_01 == ';
      console.log(TAG + "begin");
      AbilityDelegatorRegistry.getAbilityDelegator().startAbility({
        bundleName:'com.example.uiextensiontest',
        abilityName:'TestAbility'
      })

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successBackToDesktop = 'ACTS_UIExtension_Success_Back_To_Desktop';
      let failBackToDesktop = 'ACTS_UIExtension_Fail_Back_To_Desktop';
      let deviceEvent01 = 'ACTS_UIExtension_Device_Event_01';
      let canBackToDesktop = 'ACTS_UIExtension_Can_Back_To_Desktop';
      var subscribeInfo = {
        events: [appearEvent, successBackToDesktop,failBackToDesktop,canBackToDesktop]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(deviceEvent01, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == canBackToDesktop) {
            let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            await abilityDelegator.executeShellCommand("uinput -T -d 564 2759 -m 564 2759 633 2335 -u 633 2335").then((data)=>{
              console.log(TAG + '___back to desktop');
            }).catch((error)=>{
              console.log(TAG + '___back to desktop error');
            })
          } else if (data.event == successBackToDesktop) {
            done()
          }else if (data.event == failBackToDesktop) {
            expect().assertFail();
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_Device_02
     * @tc.name    : test UIExtension off the screen
     * @tc.desc    : UIExtension connect service successful then off the screen
     */      
    it('ACTS_UIExtension_Device_02',0, async function (done) {
      TAG = 'ACTS_UIExtension_Device_02 == ';
      console.log(TAG + "begin");
      AbilityDelegatorRegistry.getAbilityDelegator().startAbility({
        bundleName:'com.example.uiextensiontest',
        abilityName:'TestAbility'
      })

      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let successOffTheScreen = 'ACTS_UIExtension_Success_Off_The_Screen';
      let failOffTheScreen = 'ACTS_UIExtension_Fail_Off_The_Screen';
      let deviceEvent02 = 'ACTS_UIExtension_Device_Event_02';
      let canOffTheScreen = 'ACTS_UIExtension_Can_Off_The_Screen';
      var subscribeInfo = {
        events: [appearEvent, successOffTheScreen,failOffTheScreen,canOffTheScreen]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(deviceEvent02, (err) => {
              if (err) {
                console.log(TAG + `publish connectAbilityEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish connectAbilityEvent success');
              }
            });
          } else if (data.event == canOffTheScreen) {
            let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
            await abilityDelegator.executeShellCommand("uinput -K -d 18 -u 18").then((data)=>{
              console.log(TAG + '___screen off');
            }).catch((error)=>{
              console.log(TAG + '___screen off error');
            })
          } else if (data.event == successOffTheScreen) {
            done()
          }else if (data.event == failOffTheScreen) {
            expect().assertFail();
            done()
          }
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })
  
    /*
     * @tc.number  : ACTS_UIExtension_StartAbilityByType001
     * @tc.name    : test start UIExtensionAbility by type failed
     * @tc.desc    : start UIExtensionAbility not configured in json
     */      
    it('ACTS_UIExtension_StartAbilityByType001',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbilityByType001 == ';
      console.log(TAG + "begin");
      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let failStartAbilityByTypeEvent = 'ACTS_UIExtension_FailStartAbilityByType';
      let startAbilityByTypeEvent001 = 'ACTS_UIExtension_StartAbilityByType001';
      var subscriber;
      var subscribeInfo = {
        events: [appearEvent, failStartAbilityByTypeEvent]
      }
      await commonEventManager.createSubscriber(subscribeInfo).then(async (data) => {
        console.log(TAG + "createSubscriber data : " + JSON.stringify(data));
        globalscribe = data;
        commonEventManager.subscribe(globalscribe, async (err, data) => {
          console.log(TAG + "SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEventManager.publish(startAbilityByTypeEvent001, (err) => {
              if (err) {
                console.log(TAG + `publish startAbilityByTypeEvent failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log(TAG + 'publish startAbilityByTypeEvent success');
              }
            });
          } else if (data.event == failStartAbilityByTypeEvent) {
            done();
          } 
        });
      }).catch((error) => {
        console.log(TAG + "createSubscriber err : " + JSON.stringify(error));
        expect().assertFail();
        done();
      })
    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbilityByType002
     * @tc.name    : test start UIExtensionAbility by type failed
     * @tc.desc    : start UIExtensionAbility not configured in json
     */      
    it('ACTS_UIExtension_StartAbilityByType002',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbilityByType002 == ';
      console.log(TAG + "begin");
      try {
        let wantParam = {}
        let abilityStartCallback = {
          onError: (code, name, message) => {
            console.log(TAG + "code:" + code + "name:" + name + "message:" + message);
            expect(code).assertEqual(16000050);
            done();
          }
        }
        context.startAbilityByType("shareerror", wantParam, abilityStartCallback, (err) => {
          if (err) {
            console.error(TAG + "startAbilityByType002 fail, err:" + JSON.stringify(err));
          } else {
            console.log(TAG + "startAbilityByType002 success");
          }
        });
      } catch (error) {
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number  : ACTS_UIExtension_StartAbilityByType003
     * @tc.name    : test start UIExtensionAbility by type failed
     * @tc.desc    : start UIExtensionAbility not configured in json
     */      
    it('ACTS_UIExtension_StartAbilityByType003',0, async function (done) {
      TAG = 'ACTS_UIExtension_StartAbilityByType003 == ';
      console.log(TAG + "begin");
      try {
        let wantParam = {}
        let abilityStartCallback = {
          onError: (code, name, message) => {
            console.log(TAG + "code:" + code + "name:" + name + "message:" + message);
            expect(code).assertEqual(16000050);
            done();
          }
        }
        context.startAbilityByType("shareerror", wantParam, abilityStartCallback).then(() => {
            console.log(TAG + "startAbilityByType003 success");
          }).catch((err)=> {
            console.error(TAG + "startAbilityByType003 fail, err:" + JSON.stringify(err));
          })
      } catch (error) {
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number  : ACTS_UIExtension_RequestModalUIExtension001
     * @tc.name    : test request Modal UIExtension
     * @tc.desc    : request Modal UIExtension by want
     */  
    it('ACTS_UIExtension_RequestModalUIExtension001',0, async function (done) {
      TAG = 'ACTS_UIExtension_RequestModalUIExtension001 == ';
      console.log(TAG + "begin");
      try {
        let want = {
          bundleName: 'com.example.myapplication',
          abilityName: 'requestModalUIExtension',
          moduleName: 'requestModalUIExtension',
          parameters: {
            bundleName: 'com.example.myapplication'
          }
        };
        context.requestModalUIExtension(want, (err) => {
          if (err) {
            console.error(TAG + "requestModalUIExtension001 fail, err:" + JSON.stringify(err));
            done();
          } else {
            console.log(TAG + "requestModalUIExtension001 success");
          }
        });
      } catch (error) {
        expect().assertFail();
        done();
      }
    })    

    /*
     * @tc.number  : ACTS_UIExtension_RequestModalUIExtension002
     * @tc.name    : test request Modal UIExtension 
     * @tc.desc    : request Modal UIExtension by want
     */      
    it('ACTS_UIExtension_RequestModalUIExtension002',0, async function (done) {
      TAG = 'ACTS_UIExtension_RequestModalUIExtension002 == ';
      console.log(TAG + "begin");
      try {
        let want = {
          bundleName: 'com.example.myapplication',
          abilityName: 'requestModalUIExtension',
          moduleName: 'requestModalUIExtension',
          parameters: {
            bundleName: 'com.example.myapplication'
          }
        };
        context.requestModalUIExtension(want).then(() => {
            console.log(TAG + "requestModalUIExtension002 success");
          }).catch((err)=> {
            console.error(TAG + "requestModalUIExtension002 fail, err:" + JSON.stringify(err));
            done();
          })
      } catch (error) {
        expect().assertFail();
        done();
      }
    })
  })
}