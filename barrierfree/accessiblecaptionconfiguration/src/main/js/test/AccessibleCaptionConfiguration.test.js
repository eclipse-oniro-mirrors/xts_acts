/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import accessibility from '@ohos.accessibility'

export default function AccessibleCaptionConfiguration() {
describe('AccessibleCaptionConfiguration', function () {

  beforeEach(async function (done) {
    console.info(`AccessibleCaptionConfiguration: beforeEach starts`);
    done();
  })

  afterEach(async function (done) {
    console.info(`AccessibleCaptionConfiguration: afterEach starts`);
    done();
  })


  /**
   * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCaptionConfiguration_0100
   * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCaptionConfiguration_0100
   * @tc.desc   The parameter input is 'enableChange', test the captionManager.on() function,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleCaptionConfiguration_0100', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
    console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCaptionConfiguration_0100');
    let captionManager = accessibility.getCaptionsManager();
    let stateEventType = 'enableChange';
    let callbackdata = (data) => {}
    captionManager.on(stateEventType, callbackdata);
	captionManager.off(stateEventType, callbackdata);
    expect(true).assertTrue();
    done();
  })

  /**
   * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCaptionConfiguration_0200
   * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCaptionConfiguration_0200
   * @tc.desc   The parameter input is 'styleChange', test the captionManager.on() function,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_BARRIERFREE_API_AccessibleCaptionConfiguration_0200', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
    console.info('SUB_BASIC_BARRIERFREE_API_AccessibleCaptionConfiguration_0200');
    let captionManager = accessibility.getCaptionsManager();
    let stateEventType = 'styleChange';
    let callbackdata = (data) => {}
    captionManager.on(stateEventType, callbackdata);
	captionManager.off(stateEventType, callbackdata);
    expect(true).assertTrue();
    done();
  })

  /**
   * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0101
   * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0101
   * @tc.desc   test Ability Captions Manager
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_BARRIERFREE_API_AccessibilityErrCode_0101', TestType.FUNCTION | Size.SmallTest| Level.LEVEL0, async function (done) {
    let captionsManager = accessibility.getCaptionsManager();
    expect(captionsManager.enabled == true || captionsManager.enabled == false).assertTrue();
    expect(captionsManager.style != null).assertTrue();
    expect(captionsManager.style.backgroundColor != null).assertTrue();
    expect(captionsManager.style.fontColor != null).assertTrue();
    expect(captionsManager.style.fontEdgeType != null).assertTrue();
    expect(captionsManager.style.fontFamily != null).assertTrue();
    expect(captionsManager.style.fontScale != null).assertTrue();
    expect(captionsManager.style.windowColor != null).assertTrue();
    done();
  })

})
}