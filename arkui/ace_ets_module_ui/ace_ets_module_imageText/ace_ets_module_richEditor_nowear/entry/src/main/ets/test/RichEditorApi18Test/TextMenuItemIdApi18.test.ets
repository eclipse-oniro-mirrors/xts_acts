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

export default function TextMenuItemIdApi18() {
  describe('TextMenuItemIdApi18', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMenuItemIdApi18 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi18/TextMenuItemIdApi18',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextMenuItemIdApi18 state pages: " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if(flag){
          console.info("get translateSupport before: " + translateSupport);
          translateSupport = await getContext().resourceManager
            .getStringValue($r('sys.string.res_menu_translate_is_support').id)
          console.info("get translateSupport after: " + translateSupport);
          flag = false
        }
        if (!("TextMenuItemIdApi18" == pages.name)) {
          console.info("get TextMenuItemIdApi18 state pages.name: " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextMenuItemIdApi18 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMenuItemIdApi18 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TextMenuItemIdApi180001
     * @tc.number TextMenuItemIdApi180001
     * @tc.desc   set TextMenuItem for text
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextMenuItemIdApi180001', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemIdApi180001] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemIdApi180001 START');
        await CommonFunc.sleep(500);
        let text = await driver.findComponent(ON.id('text'));
        await CommonFunc.sleep(500);
        let point = await text.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
        await driver.assertComponentExist(ON.text('搜索'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemIdApi180001 translateSupport: ', translateSupport)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemIdApi180001] end");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdApi180002
     * @tc.number TextMenuItemIdApi180002
     * @tc.desc   set TextMenuItem for textArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextMenuItemIdApi180002', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemIdApi180002] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemIdApi180002 START');
        await CommonFunc.sleep(500);
        let textArea = await driver.findComponent(ON.id('textArea'));
        await CommonFunc.sleep(500);
        let point = await textArea.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
        await driver.assertComponentExist(ON.text('搜索'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemIdApi180002 translateSupport: ', translateSupport)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemIdApi180002] end");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdApi180003
     * @tc.number TextMenuItemIdApi180003
     * @tc.desc   set TextMenuItem for textInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextMenuItemIdApi180003', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemIdApi180003] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemIdApi180003 START');
        await CommonFunc.sleep(500);
        let textInput = await driver.findComponent(ON.id('textInput'));
        await CommonFunc.sleep(500);
        let point = await textInput.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
        await driver.assertComponentExist(ON.text('搜索'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemIdApi180003translateSupport: ', translateSupport)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemIdApi180003] end");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdApi180004
     * @tc.number TextMenuItemIdApi180004
     * @tc.desc   set TextMenuItem for richEditor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextMenuItemIdApi180004', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemIdApi180004] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemIdApi18 TextMenuItemIdApi180004 START');
        await CommonFunc.sleep(500);
        let richEditor = await driver.findComponent(ON.id('richEditor'));
        await CommonFunc.sleep(500);
        let point = await richEditor.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
        await driver.assertComponentExist(ON.text('搜索'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemIdApi180004translateSupport: ', translateSupport)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemIdApi180004] end");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdApi180005
     * @tc.number TextMenuItemIdApi180005
     * @tc.desc   set TextMenuItem for search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextMenuItemIdApi180005', Level.LEVEL0, async (done: Function) => {
      console.info("[TextMenuItemIdApi180005] start");
      if(translateSupport === '1'){
        let driver = Driver.create();
        console.info('TextMenuItemIdApi18 TextMenuItemIdApi180005 START');
        await CommonFunc.sleep(500);
        let search = await driver.findComponent(ON.id('search'));
        await CommonFunc.sleep(500);
        let point = await search.getBoundsCenter();
        await CommonFunc.sleep(500);
        await driver.longClick(point.x, point.y);
        await CommonFunc.sleep(500);
        await driver.assertComponentExist(ON.text('翻译'));
        await driver.assertComponentExist(ON.text('搜索'));
      }else{
        let strJson = getInspectorByKey('text');
        console.log('TextMenuItemIdApi180005translateSupport: ', translateSupport)
        expect(JSON.parse(strJson).$type).assertEqual("Text");
      }
      console.info("[TextMenuItemIdApi180005] end");
      done();
    });
  })
}