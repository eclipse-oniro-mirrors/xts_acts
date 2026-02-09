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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextDeleteDirectionTest() {
  describe('TextDeleteDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextDeleteDirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi12/TextDeleteDirectionTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextDeleteDirectionTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("TextDeleteDirectionTest" == pages.name)) {
          console.info("get TextDeleteDirectionTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextDeleteDirectionTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextDeleteDirectionTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextDeleteDirectionTest after each called");
    });

    /**
     * @tc.name   TextDeleteDirectionTest0001
     * @tc.number TextDeleteDirectionTest0001
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextDeleteDirectionTest0001', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextDeleteDirectionTest0001 START');
      await CommonFunc.sleep(1000);
      let TextArea = await driver.findComponent(ON.id('TextAreaDeleteDirection'))
      await CommonFunc.sleep(500);
      await TextArea.click()
      await CommonFunc.sleep(500);
      let caretPosition = await driver.findComponent(ON.id('caretPosition0'))
      await CommonFunc.sleep(500);
      await caretPosition.click()
      await CommonFunc.sleep(500);
      await driver.triggerKey(2071)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('deleteValue')).assertEqual('这');
      expect(''+AppStorage.get('deleteOffset')).assertEqual('0');
      expect(''+AppStorage.get('direction')).assertEqual('1');
      AppStorage.delete('deleteValue')
      AppStorage.delete('deleteOffset')
      AppStorage.delete('direction')
      console.info("[TextDeleteDirectionTest0001] end");
      done();
    });

    /**
     * @tc.name   TextDeleteDirectionTest0002
     * @tc.number TextDeleteDirectionTest0002
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextDeleteDirectionTest0002', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info('TextDeleteDirectionTest0002 START');
      await CommonFunc.sleep(1000);
      let TextArea = await driver.findComponent(ON.id('TextAreaDeleteDirection'))
      await CommonFunc.sleep(500);
      await TextArea.longClick()
      await CommonFunc.sleep(500);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await CommonFunc.sleep(500);
      await allSelect.click()
      await CommonFunc.sleep(500);
      await driver.triggerKey(2071)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('deleteValue')).assertEqual('这是测试删除回调文本');
      expect(''+AppStorage.get('deleteOffset')).assertEqual('0');
      expect(''+AppStorage.get('direction')).assertEqual('1');
      AppStorage.delete('deleteValue')
      AppStorage.delete('deleteOffset')
      AppStorage.delete('direction')
      console.info("[TextDeleteDirectionTest0002] end");
      done();
    });

    /**
     * @tc.name   TextDeleteDirectionTest0003
     * @tc.number TextDeleteDirectionTest0003
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextDeleteDirectionTest0003', Level.LEVEL1, async (done: Function) => {
      let driver = Driver.create();
      console.info(' TextDeleteDirectionTest0003 START');
      await CommonFunc.sleep(1000);
      let TextArea = await driver.findComponent(ON.id('TextAreaDeleteDirection'))
      await CommonFunc.sleep(500);
      await TextArea.click()
      await CommonFunc.sleep(500);
      let caretPosition = await driver.findComponent(ON.id('caretPosition6'))
      await CommonFunc.sleep(500);
      await caretPosition.click()
      await CommonFunc.sleep(500);
      await driver.triggerKey(2055)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('deleteValue')).assertEqual('除');
      expect(''+AppStorage.get('deleteOffset')).assertEqual('5');
      expect(''+AppStorage.get('direction')).assertEqual('0');
      AppStorage.delete('deleteValue')
      AppStorage.delete('deleteOffset')
      AppStorage.delete('direction')
      console.info("[TextDeleteDirectionTest0003] end");
      done();
    });

    /**
     * @tc.name   TextDeleteDirectionTest0004
     * @tc.number TextDeleteDirectionTest0004
     * @tc.desc   test TextArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('TextDeleteDirectionTest0004', Level.LEVEL3, async (done: Function) => {
      let driver = Driver.create();
      console.info(' TextDeleteDirectionTest0004 START');
      await CommonFunc.sleep(1000);
      let TextArea = await driver.findComponent(ON.id('TextAreaDeleteDirection'))
      await CommonFunc.sleep(500);
      await TextArea.longClick()
      await CommonFunc.sleep(500);
      let allSelect = await driver.findComponent(ON.text('全选'))
      await CommonFunc.sleep(500);
      await allSelect.click()
      await CommonFunc.sleep(500);
      await driver.triggerKey(2055)
      await CommonFunc.sleep(500);
      expect(''+AppStorage.get('deleteValue')).assertEqual('这是测试删除回调文本');
      expect(''+AppStorage.get('deleteOffset')).assertEqual('0');
      expect(''+AppStorage.get('direction')).assertEqual('0');
      AppStorage.delete('deleteValue')
      AppStorage.delete('deleteOffset')
      AppStorage.delete('direction')
      console.info("[TextDeleteDirectionTest0004] end");
      done();
    });
    
    /**
     * @tc.name   testTextDeleteDirection001
     * @tc.number SUB_ACE_BASIC_ETS_API_TEXT_DELETE_DRIECTION_001
     * @tc.desc   testTextDeleteDirection enum BACKWARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextDeleteDirection001', Level.LEVEL3, async (done: Function) => {
      expect(TextDeleteDirection.BACKWARD).assertEqual(0)
      done();
    });

    /**
     * @tc.name   testTextDeleteDirection002
     * @tc.number SUB_ACE_BASIC_ETS_API_TEXT_DELETE_DRIECTION_002
     * @tc.desc   testTextDeleteDirection enum FORWARD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTextDeleteDirection002', Level.LEVEL3, async (done: Function) => {
      expect(TextDeleteDirection.FORWARD).assertEqual(1)
      done();
    });
  })
}