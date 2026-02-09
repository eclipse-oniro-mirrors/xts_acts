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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function spanExample() {
  describe('SpanExample', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSpan/ImageSpanTest9',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SpanExample state pages: ' + JSON.stringify(pages));
        if (!('SpanExample' == pages.name)) {
          console.info('get SpanExample state pages.name: ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info('push SpanExample success: ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SpanExample page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('SpanExample after each called');
    });

   /**
 * @tc.number    ImageSpanTest_0100
 * @tc.name      ImageSpanTest_0100
 * @tc.desc      Test ImageSpan colorFilter functionality
 * @tc.level:    Level 1
 * @tc.type : Function test
 * @tc.size : UI component
 */
it('ImageSpanTest_0100', Level.LEVEL1, async (done: Function) => {
  console.info('ImageSpanTest_0100 START');
  let driver = await Driver.create();
  await CommonFunc.sleep(1000);
  
  // Click button to toggle colorFilter
  let button = await driver.findComponent(ON.id('ImageSpanId'));
  await button.click();
  await CommonFunc.sleep(2000);
  
  // Verify the button text changed
  let buttonText = await button.getText();
  expect(buttonText).assertEqual('ImageSpan');
  
  console.info('ImageSpanTest_0100 END');
  done();
});

/**
 * @tc.number    ImageSpanTest_0200
 * @tc.name      ImageSpanTest_0200
 * @tc.desc      Test ImageSpan with supportSvg2 set to true
 * @tc.level:    Level 1
 * @tc.type : Function test
 * @tc.size : UI component
 */
it('ImageSpanTest_0200', Level.LEVEL1, async (done: Function) => {
  console.info('ImageSpanTest_0200 START');
  let driver = await Driver.create();
  await CommonFunc.sleep(1000);
  
  // Click true button for supportSvg2
  let trueButton = await driver.findComponent(ON.id('supportSvg2True'));
  await trueButton.click();
  await CommonFunc.sleep(2000);
  
  // Verify the button is clickable
  let buttonText = await trueButton.getText();
  expect(buttonText).assertEqual('true');
  
  console.info('ImageSpanTest_0200 END');
  done();
});

/**
 * @tc.number    ImageSpanTest_0300
 * @tc.name      ImageSpanTest_0300
 * @tc.desc      Test ImageSpan with supportSvg2 set to false
 * @tc.level:    Level 1
 * @tc.type : Function test
 * @tc.size : UI component
 */
it('ImageSpanTest_0300', Level.LEVEL1, async (done: Function) => {
  console.info('ImageSpanTest_0300 START');
  let driver = await Driver.create();
  await CommonFunc.sleep(1000);
  
  // Click false button for supportSvg2
  let falseButton = await driver.findComponent(ON.id('supportSvg2False'));
  await falseButton.click();
  await CommonFunc.sleep(2000);
  
  // Verify the button is clickable
  let buttonText = await falseButton.getText();
  expect(buttonText).assertEqual('false');
  
  console.info('ImageSpanTest_0300 END');
  done();
});

/**
 * @tc.number    ImageSpanTest_0400
 * @tc.name      ImageSpanTest_0400
 * @tc.desc      Test ImageSpan with supportSvg2 set to null
 * @tc.level:    Level 1
 * @tc.type : Function test
 * @tc.size : UI component
 */
it('ImageSpanTest_0400', Level.LEVEL1, async (done: Function) => {
  console.info('ImageSpanTest_0400 START');
  let driver = await Driver.create();
  await CommonFunc.sleep(1000);
  
  // Click null button for supportSvg2
  let nullButton = await driver.findComponent(ON.id('supportSvg2Null'));
  await nullButton.click();
  await CommonFunc.sleep(2000);
  
  // Verify the button is clickable
  let buttonText = await nullButton.getText();
  expect(buttonText).assertEqual('null');
  
  console.info('ImageSpanTest_0400 END');
  done();
});

/**
 * @tc.number    ImageSpanTest_0500
 * @tc.name      ImageSpanTest_0500
 * @tc.desc      Test ImageSpan with supportSvg2 set to undefined
 * @tc.level:    Level 1
 * @tc.type : Function test
 * @tc.size : UI component
 */
it('ImageSpanTest_0500', Level.LEVEL1, async (done: Function) => {
  console.info('ImageSpanTest_0500 START');
  let driver = await Driver.create();
  await CommonFunc.sleep(1000);
  
  // Click undefined button for supportSvg2
  let undefinedButton = await driver.findComponent(ON.id('supportSvg2Undefined'));
  await undefinedButton.click();
  await CommonFunc.sleep(2000);
  
  // Verify the button is clickable
  let buttonText = await undefinedButton.getText();
  expect(buttonText).assertEqual('undefined');
  
  console.info('ImageSpanTest_0500 END');
  done();
});

/**
 * @tc.number    ImageSpanTest_0600
 * @tc.name      ImageSpanTest_0600
 * @tc.desc      Verify ImageSpan component exists and has correct ID
 * @tc.level:    Level 1
 * @tc.type : Function test
 * @tc.size : UI component
 */
it('ImageSpanTest_0600', Level.LEVEL1, async (done: Function) => {
  console.info('ImageSpanTest_0600 START');
  let driver = await Driver.create();
  await CommonFunc.sleep(1000);
  
  // Verify ImageSpan component exists
  let textComponent = await driver.findComponent(ON.id('id'));
  expect(textComponent !== null).assertTrue();
  
  console.info('ImageSpanTest_0600 END');
  done();
});
  })
}