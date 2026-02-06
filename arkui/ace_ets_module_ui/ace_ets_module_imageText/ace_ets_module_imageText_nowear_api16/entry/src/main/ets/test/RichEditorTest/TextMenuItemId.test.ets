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

import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

let translateSupport: string = "1";
let flag: boolean = true;

export default function TextMenuItemId() {
  describe('TextMenuItemId', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMenuItemId beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/TextMenuItemId',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMenuItemId state pages: " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if(flag){
          console.info("get translateSupport before: " + translateSupport);
          translateSupport = await getContext().resourceManager
            .getStringValue($r('sys.string.res_menu_translate_is_support').id)
          console.info("get translateSupport after: " + translateSupport);
          flag = false
        }
        if (!("TextMenuItemId" == pages.name)) {
          console.info("get TextMenuItemId state pages.name: " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextMenuItemId success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMenuItemId page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         TextMenuItemId0001
     * @tc.desic        set TextMenuItem for text
     */
    it('TextMenuItemId0001', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemId0001] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0001 START');
        await CommonFunc.sleep(500);
        let text = await driver.findComponent(ON.id('text'));
        await CommonFunc.sleep(500); 
        let point = await text.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemId0001 translateSupport: ', translateSupport)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemId0001] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         TextMenuItemId0002
     * @tc.desic        set TextMenuItem for textArea
     */
    it('TextMenuItemId0002', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemId0002] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0002 START');
        await CommonFunc.sleep(500);
        let textArea = await driver.findComponent(ON.id('textArea'));
        await CommonFunc.sleep(500);
        let point = await textArea.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemId0002', JSON.parse(strJson).$type)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemId0002] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0003
     * @tc.name         TextMenuItemId0003
     * @tc.desic        set TextMenuItem for textInput
     */
    it('TextMenuItemId0003', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemId0003] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0003 START');
        await CommonFunc.sleep(500);
        let textInput = await driver.findComponent(ON.id('textInput'));
        await CommonFunc.sleep(500);
        let point = await textInput.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemId0003', JSON.parse(strJson).$type)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemId0003] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0004
     * @tc.name         TextMenuItemId0004
     * @tc.desic        set TextMenuItem for richEditor
     */
    it('TextMenuItemId0004', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemId0004] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0004 START');
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('richEditor'));
        await CommonFunc.sleep(500);
        let point = await richEditor.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemId0004', JSON.parse(strJson).$type)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemId0004] end");
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0005
     * @tc.name         TextMenuItemId0005
     * @tc.desic        set TextMenuItem for search
     */
    it('TextMenuItemId0005', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemId0005] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemId TextMenuItemId0005 START');
        await CommonFunc.sleep(500);
        let search = await driver.findComponent(ON.id('search'));
        await CommonFunc.sleep(500);
        let point = await search.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemId0005', JSON.parse(strJson).$type)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemId0005] end");
      done();
    });
  })
}