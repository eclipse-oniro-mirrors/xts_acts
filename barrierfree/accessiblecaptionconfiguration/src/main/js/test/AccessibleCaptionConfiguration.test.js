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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import accessibility from '@ohos.accessibility'

export default function AccessibleCaptionConfiguration() {
describe('AccessibleCaptionConfiguration', function () {

  beforeEach(async function (done) {
    console.info(`AccessibleCaptionConfiguration: beforeEach starts`);
    done();
  })

  afterEach(async function (done) {
    console.info(`AccessibleCaptionConfiguration: afterEach starts`);
    setTimeout(done, 1000);
  })


  /*
   * @tc.number  CaptionConfiguration_0010
   * @tc.name    CaptionConfiguration_0010
   * @tc.desc    The parameter input is 'enableChange', test the captionManager.on() function,
   *             and return undefined 
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0010', 0, async function (done) {
    console.info('CaptionConfiguration_0010');
    let captionManager = accessibility.getCaptionsManager();
    let stateEventType = 'enableChange';
    let ret = captionManager.on(stateEventType, (data) => {});
    expect(ret).assertEqual(undefined);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0020
   * @tc.name    CaptionConfiguration_0020
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.on() function,
   *             and return undefined 
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0020', 0, async function (done) {
    console.info('CaptionConfiguration_0020');
    let captionManager = accessibility.getCaptionsManager();
    let stateEventType = 'styleChange';
    let ret = captionManager.on(stateEventType, (data) => {});
    expect(ret).assertEqual(undefined);
    done();
  })

   /*
   * @tc.number  CaptionConfiguration_0050
   * @tc.name    CaptionConfiguration_0050
   * @tc.desc    The parameter input is 'enableChange', test the captionManager.off() function,
   *             and return undefined 
   * @tc.size    SmallTest
   * @tc.type    User
   */
   it('CaptionConfiguration_0050', 0, async function (done) {
    console.info('CaptionConfiguration_0050');
    let captionManager = accessibility.getCaptionsManager();
    let stateEventType = 'enableChange';
    let ret = captionManager.off(stateEventType, (data) => {});
    expect(ret).assertEqual(undefined);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0060
   * @tc.name    CaptionConfiguration_0060
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.off() function,
   *             and return undefined 
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0060', 0, async function (done) {
    console.info('CaptionConfiguration_0060');
    let captionManager = accessibility.getCaptionsManager();
    let stateEventType = 'styleChange';
    let ret = captionManager.off(stateEventType, (data) => {});
    expect(ret).assertEqual(undefined);
    done();
  })
})
}
