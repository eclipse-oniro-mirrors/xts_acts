/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import bundle from '@ohos.bundle';
import bundleManager from '@ohos.bundle.bundleManager';
import application from '@ohos.app.ability.application';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let moduleContext:common.Context | null;
let context:common.UIAbilityContext;
export default function actsStageContextTest() {
  describe('ActsStageContextTest', () => {
    let count1 = 0;
    let count2 = 0;
    let count3 = 0;
    let callback1 = ()=>{
      console.info("===callback1 called");
      count1++;
    }
    let callback2 = ()=>{
      console.info("===callback2 called");
      count2++;
    }
    let callback3 = ()=>{
      console.info("===callback3 called");
      count3++;
    }
    beforeAll(()=>{
      context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
    })
    beforeEach(() => {
      count1 = 0;
      count2 = 0;
      count3 = 0;
    })

    /*
    * @tc.number    : ACTS_StageContext_0100
    * @tc.name      : get resource by $r
    * @tc.desc      : get resource by $r
    */
    it('ACTS_StageContext_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ACTS_StageContext_0100 str: " + JSON.stringify(context))
      await context.createModuleContext("entry_test").resourceManager.getString($r("app.string.TestAbility_label").id).then(str => {
        console.info("ACTS_StageContext_0100 str: " + str)
        expect(str).assertEqual("test label")
        done()
      }).catch((err:BusinessError) => {
        console.info("ACTS_StageContext_0100 err: " + err?.code + err?.message)
        expect().assertFail()
        done();
      })
    })

    /*
   * @tc.number    : ACTS_StageContext_0200
   * @tc.name      : get resource by labelId in applicationInfo
   * @tc.desc      : get resource by labelId in applicationInfo
   */
    it('ACTS_StageContext_0200', Level.LEVEL0, async (done: Function) => {
      await bundleManager.getApplicationInfo("com.example.stage_app", 0).then(appInfo => {
        return context.resourceManager.getString(Number(appInfo.labelId))
      }).then(str => {
        console.info("ACTS_StageContext_0200 labelId: " + str)
        expect(str).assertEqual("stage_app")
        done()
      }).catch((e: BusinessError) => {
        console.info("ACTS_StageContext_0200 error: " + e)
        expect().assertFail()
        done()
      })
    })

    /*
    * @tc.number    : ACTS_StageContext_0300
    * @tc.name      : get resource by labelId in abilityInfo
    * @tc.desc      : get resource by labelId in abilityInfo
    */
    it('ACTS_StageContext_0300', Level.LEVEL0, async (done: Function) => {
      await bundle.getAbilityInfo("com.example.stage_app", "MainAbility").then(abilityInfo => {
        context.resourceManager.getString(Number(abilityInfo.labelId)).then(str => {
          console.info("ACTS_StageContext_0300 labelId: " + str)
          expect(str).assertEqual("stage_app")
          done()
        })
      }).catch((e: BusinessError) => {
        console.info("ACTS_StageContext_0300 error: " + e)
        expect().assertFail()
        done()
      })
    })

    /*
    * @tc.number    : ACTS_StageContext_0400
    * @tc.name      : get resource by labelId in applicationInfo from applicationContext
    * @tc.desc      : get resource by labelId in applicationInfo from applicationContext
    */
    it('ACTS_StageContext_0400', Level.LEVEL0, async (done: Function) => {
      await bundleManager.getApplicationInfo("com.example.stage_app", 0).then(appInfo => {
        context.getApplicationContext().resourceManager.getString(Number(appInfo.labelId)).then(str => {
          console.info("ACTS_StageContext_0400 labelId: " + str)
          expect(str).assertEqual("stage_app")
          done()
        })
      }).catch((e: BusinessError) => {
        console.info("ACTS_StageContext_0400 error: " + e)
        expect().assertFail()
        done()
      })
    })

    /*
    * @tc.number    : ACTS_StageContext_0500
    * @tc.name      : get resource by labelId in abilityInfo from applicationContext
    * @tc.desc      : get resource by labelId in abilityInfo from applicationContext
    */
    it('ACTS_StageContext_0500', Level.LEVEL0, async (done: Function) => {
      await bundle.getAbilityInfo("com.example.stage_app", "MainAbility").then(abilityInfo => {
        context.getApplicationContext().resourceManager.getString(Number(abilityInfo.labelId)).then(str => {
          console.info("ACTS_StageContext_0500 labelId: " + str)
          expect(str).assertEqual("stage_app")
          done()
        })
      }).catch((e: BusinessError) => {
        console.info("ACTS_StageContext_0500 error: " + e)
        expect().assertFail()
        done()
      })
    })

    /*
    * @tc.number    : ACTS_StageContext_0600
    * @tc.name      : get resource by Resource in applicationInfo
    * @tc.desc      : get resource by Resource in applicationInfo
    */
    it('ACTS_StageContext_0600', Level.LEVEL0, async (done: Function) => {
      await bundleManager.getApplicationInfo("com.example.stage_app", 0).then(appInfo => {
        context.resourceManager.getStringValue(appInfo.labelResource).then(str => {
          console.info("ACTS_StageContext_0600 labelId: " + str)
          expect(str).assertEqual("stage_app")
          done()
        })
      }).catch((e: BusinessError) => {
        console.info("ACTS_StageContext_0600 error: " + e)
        expect().assertFail()
        done()
      })
    })

    /*
    * @tc.number    : ACTS_StageContext_0700
    * @tc.name      : get resource by Resource in applicationInfo
    * @tc.desc      : get resource by Resource in applicationInfo
    */
    it('ACTS_StageContext_0700', Level.LEVEL0, async (done: Function) => {
      await bundleManager.getApplicationInfo("com.example.stage_app", 0).then(appInfo => {
        context.getApplicationContext().resourceManager.getStringValue(appInfo.labelResource).then(str => {
          console.info("ACTS_StageContext_0700 labelId: " + str)
          expect(str).assertEqual("stage_app")
          done()
        })
      }).catch((e: BusinessError) => {
        console.info("ACTS_StageContext_0700 error: " + e)
        expect().assertFail()
        done()
      })
    })

    /*
    * @tc.number    : ACTS_StageContext_0800
    * @tc.name      : test EventHub
    * @tc.desc      : test basic on/off/emit
    */
    it('ACTS_StageContext_0800', Level.LEVEL0, async (done: Function) => {
      const eventHub = context.eventHub;
      eventHub.on("event1", callback1);
      eventHub.emit("event1");
      expect(count1).assertEqual(1);
      eventHub.off("event1", callback1);
      eventHub.emit("event1");
      expect(count1).assertEqual(1);
      done();
    })

    /*
    * @tc.number    : ACTS_StageContext_0900
    * @tc.name      : test EventHub
    * @tc.desc      : test multiple callbacks
    */
    it('ACTS_StageContext_0900', Level.LEVEL0, async (done: Function) => {
      const eventHub = context.eventHub;
      eventHub.on("event1", callback1);
      eventHub.on("event1", callback2);
      eventHub.on("event1", callback3);
      eventHub.emit("event1");
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(1);
      expect(count3).assertEqual(1)
      eventHub.off("event1", callback2);
      eventHub.emit("event1");
      expect(count1).assertEqual(2);
      expect(count2).assertEqual(1);
      expect(count3).assertEqual(2);
      eventHub.off("event1");
      eventHub.emit("event1");
      expect(count1).assertEqual(2);
      expect(count2).assertEqual(1);
      expect(count3).assertEqual(2);
      done();
    })

    /*
    * @tc.number    : ACTS_StageContext_1000
    * @tc.name      : test EventHub
    * @tc.desc      : test different events
    */
    it('ACTS_StageContext_1000', Level.LEVEL0, async (done: Function) => {
      const eventHub = context.eventHub;
      eventHub.on("event1", callback1);
      eventHub.on("event2", callback2);
      eventHub.emit("event1");
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(0);
      eventHub.emit("event2");
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(1);
      eventHub.off("event1");
      eventHub.emit("event1");
      eventHub.emit("event2");
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(2);
      eventHub.off("event2");
      eventHub.emit("event1");
      eventHub.emit("event2");
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(2);
      done();
    })

    /*
    * @tc.number    : ACTS_StageContext_1100
    * @tc.name      : test EventHub
    * @tc.desc      : test repeat on/off
    */
    it('ACTS_StageContext_1100', Level.LEVEL0, async (done: Function) => {
      const eventHub = context.eventHub;
      eventHub.on("event1", callback1);
      eventHub.on("event1", callback1);
      eventHub.emit("event1");
      expect(count1).assertEqual(1);
      eventHub.off("event1", callback1);
      eventHub.emit("event1");
      expect(count1).assertEqual(1);
      eventHub.off("event1", callback1);
      eventHub.emit("event1");
      expect(count1).assertEqual(1);
      done();
    })

    /*
    * @tc.number    : ACTS_StageContext_1200
    * @tc.name      : test EventHub
    * @tc.desc      : test call off() in callback
    */
    it('ACTS_StageContext_1200', Level.LEVEL0, async (done: Function) => {
      const eventHub = context.eventHub;
      let count = 0;
      let func = ()=>{
        let callback = ()=>{
          count++;
          eventHub.off("event1", callback);
        }
        eventHub.on("event1", callback);
      }
      func();
      func();
      func();
      func();
      eventHub.emit("event1");
      expect(count).assertEqual(4);
      eventHub.emit("event1");
      expect(count).assertEqual(4);
      done();
    })

    /*
    * @tc.number    : ACTS_StageContext_1300
    * @tc.name      : test EventHub
    * @tc.desc      : test call off() in callback
    */
    it('ACTS_StageContext_1300', Level.LEVEL0, async (done: Function) => {
      const eventHub = context.eventHub;
      let count = 0;
      let func = ()=>{
        let callback = ()=>{
          count++;
          eventHub.off("event1");
        }
        eventHub.on("event1", callback);
      }
      func();
      func();
      func();
      func();
      eventHub.emit("event1");
      expect(count).assertEqual(4);
      eventHub.emit("event1");
      expect(count).assertEqual(4);
      done();
    })

    /*
    * @tc.number    : ACTS_StageContext_1400
    * @tc.name      : test EventHub
    * @tc.desc      : test call on/off in callback
    */
    it('ACTS_StageContext_1400', Level.LEVEL0, async (done: Function) => {
      const eventHub = context.eventHub;
      let count = 0;
      let func = ()=>{
        let callback = ()=>{
          count++;
          eventHub.off("event1", callback1);
          eventHub.on("event1", callback2);
        }
        eventHub.on("event1", callback);
      }
      func();
      eventHub.on("event1", callback1);
      eventHub.emit("event1");
      expect(count).assertEqual(1);
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(0);
      eventHub.emit("event1");
      expect(count).assertEqual(2);
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(1);
      done();
    })

    /*
    * @tc.number    : ACTS_StageContext_1500
    * @tc.name      : test CreateModuleContext
    * @tc.desc      : test CreateModuleContext
    */
    it("ACTS_StageContext_1500", Level.LEVEL0, async (done:Function) => {
      console.info("ACTS_StageContext_1500 begin");

      moduleContext = null;

      try {
        application.createModuleContext(context, 'entryname').then((data: Context)=>{
          moduleContext = data;
        }).catch((error : BusinessError)=>{
          let e:string = error.toString();
          let errLog = "Parse param moduleName failed, moduleName must be string."
          expect(e.indexOf(errLog) >= 0).assertTrue();
          console.error(`createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        })
      } catch (error) {
        console.error(`createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
      }

      expect(moduleContext).assertEqual(null);
      done();
    });

    /*
    * @tc.number    : ACTS_StageContext_1600
    * @tc.name      : test CreateModuleContext
    * @tc.desc      : test CreateModuleContext
    */
    it("ACTS_StageContext_1600", Level.LEVEL0, async (done:Function) => {
      console.info("ACTS_StageContext_1600 begin");
      moduleContext = null;
      try {
        application.createModuleContext(context, 'entry').then((data: Context)=>{
          moduleContext = data;
          expect(moduleContext != null).assertTrue();
        }).catch((error : BusinessError)=>{
          let e:string = error.toString();
          let errLog = "Parse param moduleName failed, moduleName must be string."
          expect(e.indexOf(errLog) >= 0).assertTrue();
          console.error(`createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
        })
      } catch (error) {
        console.error(`createModuleContext failed, error.code: ${(error as BusinessError).code}, error.message: ${(error as BusinessError).message}`);
      }
      done();
    });
  })
}