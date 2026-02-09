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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON, Component } from '@ohos.UiTest';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';
import deviceInfo from "@ohos.deviceInfo"

export default function enableFloatingDragBarTest() {
  describe('enableFloatingDragBarTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SheetType/enableFloatingDragBar',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get enableFloatingDragBar state success ' + JSON.stringify(pages));
        if (!('enableFloatingDragBar' == pages.name)) {
          console.info('get enableFloatingDragBar state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          console.info('push enableFloatingDragBar page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push enableFloatingDragBar page error ' + JSON.stringify(err));
      }
      done()
    });
    /**
     * @tc.name   enableFloatingDragBarTest_0100
     * @tc.number enableFloatingDragBarTest_0100
     * @tc.desc   To test the sheetBorderWidth:10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('enableFloatingDragBarTest_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('enableFloatingDragBarTest_0100 START');
      let driver = await Driver.create()
      await Utils.sleep(1000);
      let button = await driver.findComponent(ON.id('dragbar'));
      await button.click();
      await Utils.sleep(1000);

      let button1 = await driver.findComponent(ON.id('close'));
      await button1.click();
      await Utils.sleep(2000);
      let strJson1 = getInspectorByKey('text1');
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      await Utils.sleep(2000);
      console.info('enableFloatingDragBarTest_0100 END');
      done();
    });


  })
}
