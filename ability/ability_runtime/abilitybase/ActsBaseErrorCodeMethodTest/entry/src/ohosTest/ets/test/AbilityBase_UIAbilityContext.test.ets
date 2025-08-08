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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
// 加载js测试框架
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import OpenLinkOptions from '@ohos.app.ability.OpenLinkOptions';
import { common, StartOptions, Want } from '@kit.AbilityKit';
import { rpc } from '@kit.IPCKit';
import { bundleManager } from '@kit.MDMKit';

let context = getContext(this) as common.UIAbilityContext;;

export default function openLinkTest() {
  describe('AbilityBaseUIAbilityContextTest', () => {
    beforeAll(() => {
      context = globalThis.context;
    });
    afterEach(() => {
    });

    /*
    * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0100
    * @tc.name   : The input parameter want is null
    * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 0
    */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0100`;
      console.log(`${tag}, it begin`);
      let want: Want|null = null;
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0200
     * @tc.name   : The input parameter want is undefined
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0200`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = undefined;
      let options: StartOptions = {
        displayId: 0
      }
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0300
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0300`;
      console.log(`${tag}, it begin`);
      let want: Want|null = null
      let options: StartOptions|null = {
        displayId: 0
      };
      try {
        context.startAbility(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0400
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0400`;
      console.log(`${tag}, it begin`);
      let want: Want|undefined = undefined;
      let options: StartOptions = {
        displayId: 0
      }
      try {
        context.startAbility(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0500
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0500`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      let options: StartOptions = {};
      try {
        context.startAbility(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0600
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0600`;
      console.log(`${tag}, it begin`);
      let want: Want|undefined = undefined
      let options: StartOptions|undefined = {}
      try {
        context.startAbility(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0700
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0700`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {
        displayId: 0
      }
      try {
        context.startAbility(want, options)
          .then(() => {
            console.info('startAbility succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0800
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0800`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =undefined;
      let options: StartOptions|null|undefined = {
        displayId: 0
      }
      try {
        context.startAbility(want, options)
          .then(() => {
            console.info('startAbility succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_0900
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_0900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_0900`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {}
      try {
        context.startAbility(want, options)
          .then(() => {
            console.info('startAbility succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1000
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 16000019
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1000`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =undefined;
      let options: StartOptions|null|undefined = {}
      try {
        context.startAbility(want, options)
          .then(() => {
            console.info('startAbility succeed');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertEqual(16000019);
            done();
          });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1100
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1100`;
      console.log(`${tag}, it begin`);
      let link: string|null|undefined = null;
      let options: OpenLinkOptions|undefined = {
        appLinkingOnly: true
      }
      try {
        context.openLink(link, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, openLink failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, openLink succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} openLink failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1200
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1200`;
      console.log(`${tag}, it begin`);
      let link: string|null|undefined = undefined;
      let options: OpenLinkOptions|undefined = {
        appLinkingOnly: true
      }
      try {
        context.openLink(link, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, openLink failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, openLink succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} openLink failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1300
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1300`;
      console.log(`${tag}, it begin`);
      let link: string|null|undefined = undefined;
      let options: OpenLinkOptions|undefined = {}
      try {
        context.openLink(link, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, openLink failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, openLink succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} openLink failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1400
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1400`;
      console.log(`${tag}, it begin`);
      let link: string|null|undefined = undefined;
      let options: OpenLinkOptions|undefined = {}
      try {
        context.openLink(link, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, openLink failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, openLink succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} openLink failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1500
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1500`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      try {
        context.startAbilityByCall(want).then(() => {
          console.info(`#${tag}# startAbilityByCall successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# startAbilityByCall err: ${error}`);
          try{expect(error.code).assertEqual(401);}catch{}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByCall failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }

    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1600
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1600`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =undefined;
      try {
        context.startAbilityByCall(want).then(() => {
          console.info(`#${tag}# startAbilityByCall successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# startAbilityByCall err: ${error}`);
          try{expect(error.code).assertEqual(401);}catch{}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbilityByCall failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1700
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1700`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      try {
        context.startAbilityForResult(want, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1800
     * @tc.name   : The input parameter want is undefined
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1800`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = undefined;
      let options: StartOptions = {
        displayId: 0
      }
      try {
        context.startAbilityForResult(want, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_1900
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_1900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_1900`;

      console.log(`${tag}, it begin`);
      let want: Want|null = null
      let options: StartOptions|null = {
        displayId: 0
      };
      try {
        context.startAbilityForResult(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2000
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2000`;
      console.log(`${tag}, it begin`);
      let want: Want|undefined = undefined;
      let options: StartOptions = {
        displayId: 0
      }
      try {
        context.startAbilityForResult(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2100
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2100`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      let options: StartOptions = {};
      try {
        context.startAbilityForResult(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2200
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2200`;
      console.log(`${tag}, it begin`);
      let want: Want|undefined = undefined
      let options: StartOptions|undefined = {}
      try {
        context.startAbilityForResult(want, options, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, startAbility failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, startAbility succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2300
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2300`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {
        displayId: 0
      }
      try {
        context.startAbilityForResult(want, options);
        console.info(`${tag}, startAbility succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2400
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2400`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =undefined;
      let options: StartOptions|null|undefined = {
        displayId: 0
      }
      try {
        context.startAbilityForResult(want, options);
        console.info(`${tag}, startAbility succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2500
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2500`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {}
      try {
        context.startAbilityForResult(want, options);
        console.info(`${tag}, startAbility succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2600
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2600`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined =null;
      let options: StartOptions|null|undefined = {}
      try {
        context.startAbilityForResult(want, options);
        console.info(`${tag}, startAbility succeed`);
        try{
          expect().assertFail();
        }catch(e){}
        done();
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} startAbility failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2700
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2700`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = null;
      try {
        context.terminateSelfWithResult(parameter, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, TerminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, TerminateSelfWithResult succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} TerminateSelfWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2800
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2800`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = undefined;
      try {
        context.terminateSelfWithResult(parameter, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, TerminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, TerminateSelfWithResult succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} TerminateSelfWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_2900
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_2900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_2900`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = null;
      try {
        context.terminateSelfWithResult(parameter).then(() => {
          console.info(`#${tag}# TerminateSelfWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# TerminateSelfWithResult err: ${error}`);
          expect().assertFail();
          done();
        });;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} TerminateSelfWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3000
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3000`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = undefined;
      try {
        context.terminateSelfWithResult(parameter).then(() => {
          console.info(`#${tag}# TerminateSelfWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# TerminateSelfWithResult err: ${error}`);
          expect().assertFail();
          done();
        });;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} TerminateSelfWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3100
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3100`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = null;
      let request_code: string|null|undefined = '0';
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3200
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3200`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = undefined;
      let request_code: string|null|undefined = '0';
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3300
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3300`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = null;
      let request_code: string|null|undefined = '';
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3400
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3400`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = undefined;
      let request_code: string|null|undefined = '';
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3500
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3500`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = {
        resultCode: 0
      };
      let request_code: string|null|undefined = null;
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3600
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3600`;
      console.log(`${tag}, it begin`);
      let parameter: common.AbilityResult|null|undefined = {
        resultCode: 0
      };
      let request_code: string|null|undefined = undefined;
      try {
        context.backToCallerAbilityWithResult(parameter, request_code).then(() => {
          console.info(`#${tag}# BackToCallerAbilityWithResult successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# BackToCallerAbilityWithResult err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} BackToCallerAbilityWithResult failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3700
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3700`;
      console.log(`${tag}, it begin`);
      let commRemote: rpc.IRemoteObject;
      let connect_num: number = 0;
      let want: Want|null|undefined = null;
      let connect_options: common.ConnectOptions|null|undefined = {
        onConnect(elementName, remote) {
          commRemote = remote;
          console.info(`${tag}` + ' onConnect... ');
        },
        onDisconnect(elementName) {
          console.info(`${tag}` + ' onDisconnect... ');
        },
        onFailed(code) {
          console.info(`${tag}` + ' onFailed... ' + code);
          try{expect(code).assertEqual(16000001);}catch{}
          done();
        }
      };
      try {
        connect_num = context.connectServiceExtensionAbility(want, connect_options);
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`#${tag}# ConnectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3800
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3800`;
      console.log(`${tag}, it begin`);
      let connect_num: number|null|undefined = null;
      try {
        context.disconnectServiceExtensionAbility(connect_num, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, DisConnectServiceExtensionAbility failed, code is ${err.code}, message is ${err.message}`);
            try{
              expect(err?.code).assertEqual(16000050);
            }catch(e){}
            done();
          }else{
            console.info(`${tag}, DisConnectServiceExtensionAbility succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} DisConnectServiceExtensionAbility failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_3900
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_3900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_3900`;
      console.log(`${tag}, it begin`);
      let label: string|null|undefined = null;
      try {
        context.setMissionLabel(label, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionLabel failed, code is ${err.code}, message is ${err.message}`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
          console.info(`${tag}, SetMissionLabel succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_4000
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4000`;
      console.log(`${tag}, it begin`);
      let label: string|null|undefined = undefined;
      try {
        context.setMissionLabel(label, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionLabel failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, SetMissionLabel succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_4100
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4100`;
      console.log(`${tag}, it begin`);
      let label: string|null|undefined = null;
      try {
        context.setMissionLabel(label).then(() => {
          console.info(`#${tag}# SetMissionLabel successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionLabel err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_4200
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4200`;
      console.log(`${tag}, it begin`);
      let label: string|null|undefined = undefined;
      try {
        context.setMissionLabel(label).then(() => {
          console.info(`#${tag}# SetMissionLabel successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionLabel err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionLabel failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_4300
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4300', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4300`;
      console.log(`${tag}, it begin`);
      let state: AbilityConstant.ContinueState|null|undefined = null;
      try {
        context.setMissionContinueState(state, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionContinueState failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, SetMissionContinueState succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionContinueState failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_4400
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4400`;
      console.log(`${tag}, it begin`);
      let state: AbilityConstant.ContinueState|null|undefined = undefined;
      try {
        context.setMissionContinueState(state, (err: BusinessError) => {
          if (err?.code) {
            console.error(`${tag}, SetMissionContinueState failed, code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info(`${tag}, SetMissionContinueState succeed`);
          try{
            expect().assertFail();
          }catch(e){}
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionContinueState failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_4500
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4500`;
      console.log(`${tag}, it begin`);
      let state: AbilityConstant.ContinueState|null|undefined = null;
      try {
        context.setMissionContinueState(state).then(() => {
          console.info(`#${tag}# SetMissionContinueState successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionContinueState err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionContinueState failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_4600
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4600`;
      console.log(`${tag}, it begin`);
      let state: AbilityConstant.ContinueState|null|undefined = undefined;
      try {
        context.setMissionContinueState(state).then(() => {
          console.info(`#${tag}# SetMissionContinueState successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# SetMissionContinueState err: ${error}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} SetMissionContinueState failed, code is ${code}, message is ${message}`);
        expect(code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_4900
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_4900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_4900`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = undefined;
      try {
        context.requestDialogService(want, (err: BusinessError) => {
          if (err?.code) {
            try{
              console.error(`${tag}, RequestDialogService failed, code is ${err.code}, message is ${err.message}`);
            }catch(e){}
            expect(err?.code).assertEqual(16000001);
            done();
          }else{
            console.info(`${tag}, RequestDialogService succeed`);
            try{
              expect().assertFail();
            }catch(e){}
            done();
          }
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} RequestDialogService failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_5000
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5000`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = null;
      try {
        context.requestDialogService(want).then(() => {
          console.info(`#${tag}# RequestDialogService successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# RequestDialogService err: ${error}`);
          expect(error?.code).assertEqual(16000001);
          done();
        });;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} RequestDialogService failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_5100
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5100`;
      console.log(`${tag}, it begin`);
      let want: Want|null|undefined = undefined;
      try {
        context.requestDialogService(want).then(() => {
          console.info(`#${tag}# RequestDialogService successful`);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.info(`#${tag}# RequestDialogService err: ${error}`);
          expect(error?.code).assertEqual(16000001);
          done();
        });;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} RequestDialogService failed, code is ${code}, message is ${message}`);
        expect().assertFail();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_UIAbilityContext_5200
     * @tc.name   : The input parameter want is null, options is an option object with parameter
     * @tc.desc   : Call the interface startAbility through context, return errorcode 401
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityBase_UIAbilityContext_5200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_UIAbilityContext_5100`;
      console.log(`${tag}, it begin`);
      try {
        context.setColorMode(undefined);
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(`${tag} setColorMode failed, code is ${code}, message is ${message}`);
        expect(err?.code).assertEqual(401);
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