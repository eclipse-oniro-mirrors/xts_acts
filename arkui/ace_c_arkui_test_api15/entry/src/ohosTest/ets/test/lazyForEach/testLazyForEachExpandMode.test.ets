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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import Utils from '../common/Utils';

export default function TestLazyForEachExpandMode(){

  describe('TestLazyForEachExpandMode', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0100
     * @tc.name       : testLazyForEachExpandMode001
     * @tc.desc       : testing lazy for each expand error code
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode001', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode001';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id9'));
      await button1.click();
      await Utils.sleep(1000)
      let button2 = await driver.findComponent(ON.id('button_id10'));
      await button2.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id9').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('button_id10').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0200
     * @tc.name       : testLazyForEachExpandMode002
     * @tc.desc       : testing lazy for each expand
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode002', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode002';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id1'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id1').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0300
     * @tc.name       : testLazyForEachExpandMode003
     * @tc.desc       : testing lazy for each expand value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode003', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode003';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id2'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id2').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0400
     * @tc.name       : testLazyForEachExpandMode004
     * @tc.desc       : testing lazy for each expand value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode004', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode004';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id3'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id3').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0500
     * @tc.name       : testLazyForEachExpandMode005
     * @tc.desc       : testing lazy for each expand value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode005', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode005';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id4'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id4').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0600
     * @tc.name       : testLazyForEachExpandMode006
     * @tc.desc       : testing lazy for each expand value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode006', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode006';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id5'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id5').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0700
     * @tc.name       : testLazyForEachExpandMode007
     * @tc.desc       : testing lazy for each expand value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode007', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode007';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id6'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id6').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0600
     * @tc.name       : testLazyForEachExpandMode006
     * @tc.desc       : testing lazy for each expand value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode008', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode008';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id7'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id7').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_LAZYFOREACH_EXPANDMODE_0900
     * @tc.name       : testLazyForEachExpandMode009
     * @tc.desc       : testing lazy for each expand value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLazyForEachExpandMode009', 0, async (done: Function) => {
      let PAGE_TAG = 'TestLazyForEachExpandMode009';
      await Utils.pushPage(`lazyForEach/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = await Driver.create()
      await Utils.sleep(1000)
      let button1 = await driver.findComponent(ON.id('button_id8'));
      await button1.click();
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('button_id8').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  })
}