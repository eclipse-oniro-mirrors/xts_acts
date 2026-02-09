/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import ohosrouter from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common'
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';

export default function ListAddJsunit() {
  describe('ListAddJsunit', () => {
    beforeAll(async () => {
      console.info("List_addJsunit beforeEach start");
      try {
        ohosrouter.clear();
        let pages = ohosrouter.getState();
        console.info("List_addJsunit " + JSON.stringify(pages));
        if (!("List_add" == pages.name)) {
          console.info("List_addJsunit state success " + JSON.stringify(pages.name));
          ohosrouter.pushUrl({
            url: 'MainAbility/pages/List/List_add',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
            // success
          })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push List_add page success ");
        }
      } catch (err) {
        console.error("push List_add page error: " + err);
      }
    });

    /**
     * @tc.name   ListAddJsunit_0200
     * @tc.number apiCommponentAddJsunit_0200
     * @tc.desc   Test List onScrollStartText
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ListAddJsunit_0200', Level.LEVEL1, async (done: Function) => {
      console.info('ListAddJsunit_0200 START');
      await CommonFunc.sleep(1000);
      let gridAdd = CommonFunc.getComponentRectOnScreen('listadd');
      let top = gridAdd.top;
      let bottom = gridAdd.bottom;
      let right = gridAdd.right;
      let left = gridAdd.left;
      let driver = await Driver.create();
      await driver.swipe(Math.round(left + Math.round(vp2px(30))), Math.round(top + Math.round(vp2px(30))), Math.round(left + Math.round(vp2px(20))), Math.round(top + Math.round(vp2px(30))));
      await CommonFunc.sleep(1000);
      // judge whether the top
      let onScrollStartText = await driver.findComponent(ON.id('4'));
      let textAdd = await onScrollStartText.getText();
      console.info("[ListAddJsunit_0200] onScrollStartText: " + textAdd);
      expect(textAdd).assertEqual('4');
      done();
    });
  })
}