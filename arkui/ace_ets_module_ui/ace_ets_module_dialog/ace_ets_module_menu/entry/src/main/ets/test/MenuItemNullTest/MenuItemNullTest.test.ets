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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../MainAbility/common/Utils';

export default function MenuItemNullTest() {
  describe('MenuItemNullTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MenuItemNull/MenuItemNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get MenuItemNullTest state success ' + JSON.stringify(pages));
        if (!('MenuItemNull.ets' == pages.name)) {
          console.info('get MenuItemNullTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push MenuItemNullTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push MenuItemNullTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   Menunull_001
     * @tc.number Menunull_001
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Menunull_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'Menuunll';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let null1 = await driver.findComponent(ON.id('null'))
      await null1.click()
      await Utils.sleep(1000);
      let resource = getInspectorByKey('Menunull');
      expect(JSON.parse(resource).$attrs.fontSize).assertEqual('16.00fp')
      expect(JSON.parse(resource).$attrs.menuItemDivider).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.menuItemGroupDivider).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.font.value).assertEqual(undefined)
      // expect(JSON.parse(resource).$attrs.radioStyle.checkedBackgroundColor).assertEqual(undefined)
      await Utils.sleep(2000);
      await null1.click()
      console.info('[' + tagName + '] END ===========================');
      done();
    })

    /**
     * @tc.name   Menuundefined_001
     * @tc.number Menuundefined_001
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Menuundefined_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'ratingundefined_001';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let null2 = await driver.findComponent(ON.id('undefined'))
      await null2.click()
      await Utils.sleep(1000);
      let resource = getInspectorByKey('Menuundefined');
      expect(JSON.parse(resource).$attrs.fontSize).assertEqual('16.00fp')
      expect(JSON.parse(resource).$attrs.menuItemDivider).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.menuItemGroupDivider).assertEqual(undefined)
      await Utils.sleep(2000);
      await null2.click()
      console.info('[' + tagName + '] END ===========================');
      done();
    })

    /**
     * @tc.name   MenuItemnull_001
     * @tc.number MenuItemnull_001
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuItemnull_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'ratingundefined_001';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let null2 = await driver.findComponent(ON.id('null'))
      await null2.click()
      await Utils.sleep(1000);
      let resource = getInspectorByKey('Menuitemnull');
      expect(JSON.parse(resource).$attrs.selectIcon).assertEqual('false')
      expect(JSON.parse(resource).$attrs.contentFont.value).assertEqual(undefined)

      expect(JSON.parse(resource).$attrs.labelFont.value).assertEqual(undefined)
      await null2.click()
      await Utils.sleep(2000);
      console.info('[' + tagName + '] END ===========================');
      done();
    })

    /**
     * @tc.name   MenuItemundefined_001
     * @tc.number MenuItemundefined_001
     * @tc.desc   createMenuToWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MenuItemundefined_001', Level.LEVEL0, async (done:Function) =>{
      let tagName = 'ratingundefined_001';
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let null2 = await driver.findComponent(ON.id('undefined'))
      await null2.click()
      await Utils.sleep(1000);
      let resource = getInspectorByKey('Menuundefined');
      expect(JSON.parse(resource).$attrs.selectIcon).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.contentFont).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.contentFontColor).assertEqual(undefined)

      expect(JSON.parse(resource).$attrs.labelFontColor).assertEqual(undefined)
      expect(JSON.parse(resource).$attrs.labelFont).assertEqual(undefined)
      await Utils.sleep(2000);
      await null2.click()
      console.info('[' + tagName + '] END ===========================');
      done();
    })
  })
}