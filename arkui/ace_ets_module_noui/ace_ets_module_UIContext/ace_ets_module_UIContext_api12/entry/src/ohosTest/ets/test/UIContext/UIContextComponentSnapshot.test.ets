/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function UIContextComponentSnapshot() {
  describe('UIContextComponentSnapshot', () => {
    beforeEach(async (done: Function) => {
      console.info('UIContextComponentSnapshot beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/UIContextComponentSnapshot',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get UIContextComponentSnapshot state pages:' + JSON.stringify(pages));
        if (!('UIContextComponentSnapshot' == pages.name)) {
          console.info('get UIContextComponentSnapshot pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push UIContextComponentSnapshot page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push UIContextComponentSnapshot page error:' + err);
      }
      console.info('UIContextComponentSnapshot beforeEach end');
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number SUB_ACE_UI_SNAPSHOT_GETSYNC_0390
     * @tc.name testButton
     * @tc.desc
     */
    it('UIContextComponentSnapshot_0100', 0, async (done: Function) => {
      console.info('UIContextComponentSnapshot_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('gPromise'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('ERRORcODE');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('UIContextComponentSnapshot_0100 component obj is: ' + obj);
      expect(obj.$attrs.content).assertEqual('100001');
      console.info('UIContextComponentSnapshot_0100 END')
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_SNAPSHOT_GETSYNC_0370
     * @tc.name testButton
     * @tc.desc
     */
    it('UIContextComponentSnapshot_0200', 0, async (done: Function) => {
      console.info('UIContextComponentSnapshot_0200 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('gPromise1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('ERRORcODE1');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('UIContextComponentSnapshot_0200 component obj is: ' + obj);
      expect(obj.$attrs.content).assertEqual('100001');
      console.info('UIContextComponentSnapshot_0200 END')
      done();
    });

    /**
     * @tc.number SUB_ACE_UI_SNAPSHOT_GETSYNC_0410
     * @tc.name testButton
     * @tc.desc
     */
    it('UIContextComponentSnapshot_0300', 0, async (done: Function) => {
      console.info('UIContextComponentSnapshot_0300 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('gPromise2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('ERRORcODE2');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('UIContextComponentSnapshot_0300 component obj is: ' + obj);
      expect(obj.$attrs.content).assertEqual('100001');
      console.info('UIContextComponentSnapshot_0300 END')
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_SNAPSHOT_GETSYNC_0380
     * @tc.name testButton
     * @tc.desc
     */
    it('UIContextComponentSnapshot_0400', 0, async (done: Function) => {
      console.info('UIContextComponentSnapshot_0400 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let button = await driver.findComponent(ON.id('gPromise3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strcontent = getInspectorByKey('ERRORcODE3');
      let obj: ESObject = JSON.parse(strcontent);
      await CommonFunc.sleep(1000);
      console.info('UIContextComponentSnapshot_0400 component obj is: ' + obj);
      expect(obj.$attrs.content).assertEqual('100001');
      console.info('UIContextComponentSnapshot_0400 END')
      done();
    });
  })
}