/*
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
// 加载js测试框架
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import OpenLinkOptions from '@ohos.app.ability.OpenLinkOptions';

let context;
let link = 'example://www.example.com';
let linkNotExist = 'demo://www.example.com';
let invalidParamErrNo = 401;
let componentNotExistErrNo = 16000019;
let resultCode = 111;
let trueParamOptions: OpenLinkOptions = {
  appLinkingOnly: true,
  parameters: {demo_key: "demo_value"}
};
let falseParamOptions: OpenLinkOptions = {
  appLinkingOnly: false,
  parameters: {demo_key: "demo_value"}
};
let paramOptions: OpenLinkOptions = {
  parameters: {demo_key: "demo_value", demo_num: 111}
};


export default function openLinkTest() {
  describe('ActsOpenLinkTest', function () {
    beforeAll(function () {
      context = globalThis.context;
    });
    afterEach((done) => {
      console.log('OpenLink afterEach start');
      setTimeout(() => {
        console.log('OpenLink afterEach end');
        done();
      }, 1000);
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0100
     * @tc.name   : The input parameter 'link' is empty
     * @tc.desc   : Call the openLink interface through context, and catch parameter invalid exception
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0100', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0100`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink("").then(() => {
          console.info(`#${tag}# open link successful`);
          expect().assertFail();
          done();
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect().assertFail();
          // expect(error.code == undefined).assertFalse();
          // expect(error.code).assertEqual(-1);
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect(err.code).assertEqual(invalidParamErrNo);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0200
     * @tc.name   : The input parameter 'link' is illegal uri string
     * @tc.desc   : Call the openLink interface through context, and catch parameter invalid exception
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0200', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0200`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink("illegalUri").then(() => {
          console.info(`#${tag}# open link successful`);
          expect().assertFail();
          done();
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect(err.code).assertEqual(invalidParamErrNo);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0300
     * @tc.name   : The input parameter 'link' is legal uri string and target app exist
     * @tc.desc   : Call the openLink interface through context, open target app successfully
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0300', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0300`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(link).then(() => {
          console.info(`#${tag}# open link successful`);
          done();
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0400
     * @tc.name   : The input parameter 'link' is legal uri string but target app not exist
     * @tc.desc   : Call the openLink interface through context, open target app failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0400', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0400`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(linkNotExist).then(() => {
          console.info(`#${tag}# open link successful`);
          expect().assertFail();
          done();
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect(error.code).assertEqual(componentNotExistErrNo);
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0500
     * @tc.name   : The input parameter 'link' is valid, appLinkingOnly is true.
     * @tc.desc   : Call the openLink interface through context, open target app failed.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0500', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0500`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(link, trueParamOptions).then(() => {
          console.info(`#${tag}# open link successful`);
          expect().assertFail();
          done();
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect(error.code).assertEqual(componentNotExistErrNo);
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0600
     * @tc.name   : The input parameter 'link' is valid, appLinkingOnly is false.
     * @tc.desc   : Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0600', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0600`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(link, falseParamOptions).then(() => {
          console.info(`#${tag}# open link successful`);
          done();
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0700
     * @tc.name   : The input parameter 'link' is valid, set parameters.
     * @tc.desc   : Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0700', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0700`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(link, paramOptions).then(() => {
          console.info(`#${tag}# open link successful`);
          done();
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0800
     * @tc.name   : The input parameter 'link' is valid, set parameters.
     * @tc.desc   : Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0800', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0800`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(link, paramOptions, (err, result) => {
                            console.info(`openLink callback result: ${JSON.stringify(result.resultCode)}`);
                            console.info(`openLink callback result data: ${JSON.stringify(result.want)}`);
                            expect(result.resultCode).assertEqual(resultCode);
                            done();
                         }
          ).then(() => {
          console.info(`#${tag}# open link successful`);
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_0900
     * @tc.name   : The input parameter 'link' is valid, set parameters, appLinkingOnly is true.
     * @tc.desc   : Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_0900', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_0900`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(link, trueParamOptions, (err, result) => {
                            console.info(`openLink callback result: ${JSON.stringify(result.resultCode)}`);
                            console.info(`openLink callback result data: ${JSON.stringify(result.want)}`);
                            expect(result.resultCode).assertEqual(resultCode);
                            done();
                         }
          ).then(() => {
          console.info(`#${tag}# open link successful`);
          expect().assertFail();
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect(error.code).assertEqual(componentNotExistErrNo);
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OpenLink_1000
     * @tc.name   : The input parameter 'link' is valid, set parameters, appLinkingOnly is true.
     * @tc.desc   : Call the openLink interface through context, open target app success.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('AbilityRuntime_OpenLink_1000', 0, function (done) {
      let tag = `SUB_Ability_AbilityRuntime_OpenLink_1000`;
      console.log(`${tag}, it begin`);

      try {
        context.openLink(link, falseParamOptions, (err, result) => {
                            console.info(`openLink callback result: ${JSON.stringify(result.resultCode)}`);
                            console.info(`openLink callback result data: ${JSON.stringify(result.want)}`);
                            expect(result.resultCode).assertEqual(resultCode);
                            done();
                         }
          ).then(() => {
          console.info(`#${tag}# open link successful`);
        }).catch((error) => {
          console.info(`#${tag}# open link err : ${error}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(`#${tag}# open fail : ${err}`);
        expect().assertFail();
        done();
      }
    });
  })
}

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}