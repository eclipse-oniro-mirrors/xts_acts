'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'

export default function ComponentSnapshotSync() {
  describe('componentSnapshotSync', () => {
    beforeAll(() => {
      console.info("componentSnapshotSync beforeEach start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.UIContext12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("componentSnapshotSync beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/componentSnapshot/componentSnapshotSync',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get componentSnapshotSync state pages:" + JSON.stringify(pages));
        if (!("componentSnapshotSync" == pages.name)) { //"componentSnapshotSync" == pages.name
          console.info("get componentSnapshotSync pages.name:" + '');


          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push componentSnapshotSync page error:" + err);
      }
      console.info("componentSnapshotSync beforeEach end");
    });


    afterEach(async () => {
    });


    
    /**
     * @tc.number   componentSnapshotSync_static_0100
     * @tc.name     componentSnapshotSync_static_0100
     * @tc.desc     componentSnapshotSync_static_0100
     * @tc.level    Level.LEVEL0
     */
it('componentSnapshotSync_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('componentSnapshotSync_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('gPromise'));
      await CommonFunc.sleep(2000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strcontent = inspector.getInspectorByKey('ERRORcODE');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(2000);
      console.info('componentSnapshotSync_static_0100 component obj is: ' + obj);
      console.info('[wll]'+JSON.stringify(obj.getElement('$attrs')))
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100001');
      console.info('componentSnapshotSync_static_0100 END')
      done();
    });


    
    /**
     * @tc.number   componentSnapshotSync_static_0200
     * @tc.name     componentSnapshotSync_static_0200
     * @tc.desc     componentSnapshotSync_static_0200
     * @tc.level    Level.LEVEL0
     */
it('componentSnapshotSync_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('componentSnapshotSync_static_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('gPromise1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strcontent = inspector.getInspectorByKey('ERRORcODE1');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('componentSnapshotSync_static_0200 component obj is: ' + obj);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100001');
      console.info('componentSnapshotSync_static_0200 END')
      done();
    });


    
    /**
     * @tc.number   componentSnapshotSync_static_0300
     * @tc.name     componentSnapshotSync_static_0300
     * @tc.desc     componentSnapshotSync_static_0300
     * @tc.level    Level.LEVEL0
     */
it('componentSnapshotSync_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('componentSnapshotSync_static_0300 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('gPromise2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strcontent = inspector.getInspectorByKey('ERRORcODE2');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('componentSnapshotSync_static_0300 component obj is: ' + obj);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100001');
      console.info('componentSnapshotSync_static_0300 END')
      done();
    });


    
    /**
     * @tc.number   componentSnapshotSync_static_0400
     * @tc.name     componentSnapshotSync_static_0400
     * @tc.desc     componentSnapshotSync_static_0400
     * @tc.level    Level.LEVEL0
     */
it('componentSnapshotSync_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('componentSnapshotSync_static_0400 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('gPromise3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strcontent = inspector.getInspectorByKey('ERRORcODE3');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('componentSnapshotSync_static_0400 component obj is: ' + obj);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100001');
      console.info('componentSnapshotSync_static_0400 END')
      done();
    });


    
    /**
     * @tc.number   componentSnapshotSync_static_0500
     * @tc.name     componentSnapshotSync_static_0500
     * @tc.desc     componentSnapshotSync_static_0500
     * @tc.level    Level.LEVEL0
     */
it('componentSnapshotSync_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('componentSnapshotSync_static_0500 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('gPromise4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strcontent = inspector.getInspectorByKey('ERRORcODE4');
      let obj = JSON.parseJsonElement(strcontent);
      await CommonFunc.sleep(1000);
      console.info('componentSnapshotSync_static_0500 component obj is: ' + obj);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100001');
      console.info('componentSnapshotSync_static_0500 END')
      done();
    });
  })
}