/**
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
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import CommonFunc from '../../MainAbility/utils/Common';

export default function SearchXtsJsunit() {
  describe('SearchXtsJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info('SearchXtsJsunit beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/xts/SearchXts',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SearchXts state pages: ' + JSON.stringify(pages));
        if (!('SearchXts' == pages.name)) {
          console.info('get SearchXts state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info('push SearchXts page result: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SearchXts page error: ' + err);
      }
      done();
    })

    /**
     * @tc.name   SearchXtsJsunit_0101
     * @tc.number SearchXtsJsunit_0101
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchXtsJsunit_0101',  Level.LEVEL0, async (done: Function) => {
      console.info('[SearchXtsJsunit_0101] START');
      let strJson = getInspectorByKey('key_search_inputFilter');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SearchXtsJsunit_0101] inputFilter ========== : ' + JSON.stringify(obj.$attrs.inputFilter));
      expect(obj.$attrs.inputFilter).assertEqual('2');
      console.info('[SearchXtsJsunit_0101] END');
      done();
    });

    /**
     * @tc.name   SearchXtsJsunit_0102
     * @tc.number SearchXtsJsunit_0102
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchXtsJsunit_0102',  Level.LEVEL0, async (done: Function) => {
      console.info('[SearchXtsJsunit_0102] START');
      let strJson = getInspectorByKey('key_search_selectedBackgroundColor');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SearchXtsJsunit_0102] obj is: ' + JSON.stringify(obj.$attrs));
      console.info('[SearchJsunit_0102] selectedBackgroundColor ========== : ' + JSON.stringify(obj.$attrs.selectedBackgroundColor));
      expect(obj.$attrs.selectedBackgroundColor).assertEqual('#F5F5F5F5');
      console.info('[SearchXtsJsunit_0102] END');
      done();
    });

    /**
     * @tc.name   SearchXtsJsunit_0103
     * @tc.number SearchXtsJsunit_0103
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchXtsJsunit_0103',  Level.LEVEL0, async (done: Function) => {
      console.info('[SearchXtsJsunit_0103] START');
      let strJson = getInspectorByKey('key_search_textIndent');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[SearchXtsJsunit_0103] obj is: ' + JSON.stringify(obj.$attrs));
      console.info('[SearchXtsJsunit_0103] textIndent ========== : ' + JSON.stringify(obj.$attrs.textIndent));
      expect(obj.$attrs.textIndent).assertEqual('5.00vp');
      console.info('[SearchXtsJsunit_0103] END');
      done();
    });

    /**
     * @tc.name   SearchXtsTest_0105
     * @tc.number SearchXtsTest_0105
     * @tc.desc   Set attribute values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SearchXtsTest_0105',  Level.LEVEL0, async (done: Function) => {
      console.info('SearchXtsTest_0105 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('key_search_onEditChange'));
      await button.click();
      await CommonFunc.sleep(1000);
      let text1 = getInspectorByKey('key_search_onEditChange_text1');
      let Obj: Record<string, ESObject> = JSON.parse(text1);
      expect(Obj.$attrs.content).assertEqual('onEditChange');
      console.info('SearchXtsTest_0105 END');
      done();
    });

    // /**
    //  * @tc.number SearchXtsTest_0106
    //  * @tc.name Test the properties of components
    //  * @tc.desc Set attribute values
    //  * @tc.size MediumTest
    //  * @tc.type Function
    //  * @tc.level 0
    //  */
    /**
     * @tc.name   SearchXtsTest_0106
     * @tc.number SearchXtsTest_0106
     * @tc.desc   SearchXtsTest_0106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    // it('SearchXtsTest_0106',  Level.LEVEL0, async (done: Function) => {
    //   console.info('SearchXtsTest_0106 START');
    //   let driver1 = Driver.create();
    //   let button = await driver1.findComponent(ON.id('key_search_setTextSelection'));
    //   await button.click();
    //   await CommonFunc.sleep(1000);
    //   let start = getInspectorByKey('key_search_setTextSelection_start');
    //   let end = getInspectorByKey('key_search_setTextSelection_end');
    //   let start_obj = JSON.parse(start);
    //   let end_obj = JSON.parse(end);
    //   console.info('SearchXtsTest_0106 START' + start_obj.$attrs.content);
    //   console.info('SearchXtsTest_0106 START' + end_obj.$attrs.content);
    //   expect(start_obj.$attrs.content).assertEqual(2);
    //   expect(end_obj.$attrs.content).assertEqual(15);
    //   console.info('SearchXtsTest_0106 END');
    //   done();
    // });
  })
}
