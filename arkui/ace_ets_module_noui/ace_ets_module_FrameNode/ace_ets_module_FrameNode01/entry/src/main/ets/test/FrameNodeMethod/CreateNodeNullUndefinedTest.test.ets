/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function CreateNodeNullUndefinedTest() {
  describe('CreateNodeNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("CreateNodeNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNodeMethod/CreateNodeNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CreateNodeNullUndefinedTest state pages:" + JSON.stringify(pages));
        let result = await router.pushUrl(options);
        if (!("gestureEventTest" == pages.name)) {
          console.info("get CreateNodeNullUndefinedTest pages.name:" + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push CreateNodeNullUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CreateNodeNullUndefinedTest page error:" + err);
      }
      console.info("CreateNodeNullUndefinedTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CreateNodeNullUndefinedTest after each called");
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0100
     * @tc.name      CreateNodeNullUndefinedTest_0100
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeColumnNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeColumnNull')
      expect(AppStorage.get('createNodeColumnUndefined')).assertEqual(401);
      AppStorage.delete('createNodeColumnUndefined')
      console.info('[CreateNodeNullUndefinedTest_0100] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0200
     * @tc.name      CreateNodeNullUndefinedTest_0200
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeRowNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeRowNull')
      expect(AppStorage.get('createNodeRowUndefined')).assertEqual(401);
      AppStorage.delete('createNodeRowUndefined')
      console.info('[CreateNodeNullUndefinedTest_0200] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0300
     * @tc.name      CreateNodeNullUndefinedTest_0300
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0300', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeStackNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeStackNull')
      expect(AppStorage.get('createNodeStackUndefined')).assertEqual(401);
      AppStorage.delete('createNodeStackUndefined')
      console.info('[CreateNodeNullUndefinedTest_0300] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0400
     * @tc.name      CreateNodeNullUndefinedTest_0400
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0400', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeGridRowNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeGridRowNull')
      expect(AppStorage.get('createNodeGridRowUndefined')).assertEqual(401);
      AppStorage.delete('createNodeGridRowUndefined')
      console.info('[CreateNodeNullUndefinedTest_0400] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0500
     * @tc.name      CreateNodeNullUndefinedTest_0500
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0500', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeGridColNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeGridColNull')
      expect(AppStorage.get('createNodeGridColUndefined')).assertEqual(401);
      AppStorage.delete('createNodeGridColUndefined')
      console.info('[CreateNodeNullUndefinedTest_0500] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0600
     * @tc.name      CreateNodeNullUndefinedTest_0600
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0600', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeFlexNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeFlexNull')
      expect(AppStorage.get('createNodeFlexUndefined')).assertEqual(401);
      AppStorage.delete('createNodeFlexUndefined')
      console.info('[CreateNodeNullUndefinedTest_0600] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0700
     * @tc.name      CreateNodeNullUndefinedTest_0700
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0700', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeRelativeContainerNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeRelativeContainerNull')
      expect(AppStorage.get('createNodeRelativeContainerUndefined')).assertEqual(401);
      AppStorage.delete('createNodeRelativeContainerUndefined')
      console.info('[CreateNodeNullUndefinedTest_0700] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0800
     * @tc.name      CreateNodeNullUndefinedTest_0800
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0800', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeDividerNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeDividerNull')
      expect(AppStorage.get('createNodeDividerUndefined')).assertEqual(401);
      AppStorage.delete('createNodeDividerUndefined')
      console.info('[CreateNodeNullUndefinedTest_0800] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_0900
     * @tc.name      CreateNodeNullUndefinedTest_0900
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_0900', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeBlankNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeBlankNull')
      expect(AppStorage.get('createNodeBlankUndefined')).assertEqual(401);
      AppStorage.delete('createNodeBlankUndefined')
      console.info('[CreateNodeNullUndefinedTest_0900] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1000
     * @tc.name      CreateNodeNullUndefinedTest_1000
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1000', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeXComponentNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeXComponentNull')
      expect(AppStorage.get('createNodeXComponentUndefined')).assertEqual(401);
      AppStorage.delete('createNodeXComponentUndefined')
      console.info('[CreateNodeNullUndefinedTest_1000] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1100
     * @tc.name      CreateNodeNullUndefinedTest_1100
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1100', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeXComponentThreeNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeXComponentThreeNull')
      expect(AppStorage.get('createNodeXComponentThreeUndefined')).assertEqual(401);
      AppStorage.delete('createNodeXComponentThreeUndefined')
      expect(AppStorage.get('createNodeXComponentOptionsNull')).assertEqual('success');
      AppStorage.delete('createNodeXComponentOptionsNull')
      expect(AppStorage.get('createNodeXComponentOptionsUndefined')).assertEqual("success");
      AppStorage.delete('createNodeXComponentOptionsUndefined')
      console.info('[CreateNodeNullUndefinedTest_1100] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1200
     * @tc.name      CreateNodeNullUndefinedTest_1200
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1200', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeParametersThreeNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeParametersThreeNull')
      expect(AppStorage.get('createNodeParametersThreeUndefined')).assertEqual(401);
      AppStorage.delete('createNodeParametersThreeUndefined')
      expect(AppStorage.get('createNodeXComponentParametersNull')).assertEqual('success');
      AppStorage.delete('createNodeXComponentParametersNull')
      expect(AppStorage.get('createNodeXComponentParametersUndefined')).assertEqual("success");
      AppStorage.delete('createNodeXComponentParametersUndefined')
      console.info('[CreateNodeNullUndefinedTest_1200] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1300
     * @tc.name      CreateNodeNullUndefinedTest_1300
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1300', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeButtonNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeButtonNull')
      expect(AppStorage.get('createNodeButtonUndefined')).assertEqual(401);
      AppStorage.delete('createNodeButtonUndefined')
      console.info('[CreateNodeNullUndefinedTest_1300] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1400
     * @tc.name      CreateNodeNullUndefinedTest_1400
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1400', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeCheckboxNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeCheckboxNull')
      expect(AppStorage.get('createNodeCheckboxUndefined')).assertEqual(401);
      AppStorage.delete('createNodeCheckboxUndefined')
      console.info('[CreateNodeNullUndefinedTest_1400] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1500
     * @tc.name      CreateNodeNullUndefinedTest_1500
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1500', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeCheckboxGroupNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeCheckboxGroupNull')
      expect(AppStorage.get('createNodeCheckboxGroupUndefined')).assertEqual(401);
      AppStorage.delete('createNodeCheckboxGroupUndefined')
      console.info('[CreateNodeNullUndefinedTest_1500] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1600
     * @tc.name      CreateNodeNullUndefinedTest_1600
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1600', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeRadioNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeRadioNull')
      expect(AppStorage.get('createNodeRadioUndefined')).assertEqual(401);
      AppStorage.delete('createNodeRadioUndefined')
      console.info('[CreateNodeNullUndefinedTest_1600] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1700
     * @tc.name      CreateNodeNullUndefinedTest_1700
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1700', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeRatingNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeRatingNull')
      expect(AppStorage.get('createNodeRatingUndefined')).assertEqual(401);
      AppStorage.delete('createNodeRatingUndefined')
      console.info('[CreateNodeNullUndefinedTest_1700] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1800
     * @tc.name      CreateNodeNullUndefinedTest_1800
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1800', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeSelectNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeSelectNull')
      expect(AppStorage.get('createNodeSelectUndefined')).assertEqual(401);
      AppStorage.delete('createNodeSelectUndefined')
      console.info('[CreateNodeNullUndefinedTest_1800] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_1900
     * @tc.name      CreateNodeNullUndefinedTest_1900
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_1900', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_1900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeSliderNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeSliderNull')
      expect(AppStorage.get('createNodeSliderUndefined')).assertEqual(401);
      AppStorage.delete('createNodeSliderUndefined')
      console.info('[CreateNodeNullUndefinedTest_1900] END');
      done();
    });

    /**
     * @tc.number    CreateNodeNullUndefinedTest_2000
     * @tc.name      CreateNodeNullUndefinedTest_2000
     * @tc.desc      createNode null undefined Test
     * @tc.level     Level2
     * @tc.type
     * @tc.size
     */
    it('CreateNodeNullUndefinedTest_2000', Level.LEVEL2, async (done: Function) => {
      console.info('CreateNodeNullUndefinedTest_2000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      expect(AppStorage.get('createNodeToggleNull')).assertEqual("TypeError: Cannot use 'in' operator in Non-Object");
      AppStorage.delete('createNodeToggleNull')
      expect(AppStorage.get('createNodeToggleUndefined')).assertEqual(401);
      AppStorage.delete('createNodeToggleUndefined')
      expect(AppStorage.get('createNodeToggleOptionsNull')).assertEqual('success');
      AppStorage.delete('createNodeToggleOptionsNull')
      expect(AppStorage.get('createNodeToggleOptionsUndefined')).assertEqual('success');
      AppStorage.delete('createNodeToggleOptionsUndefined')
      console.info('[CreateNodeNullUndefinedTest_2000] END');
      done();
    });

  })
}