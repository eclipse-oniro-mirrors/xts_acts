/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { getPermission,driveFn,sleep } from '../common';

export default function setAssetCompatibleCapabilityTest () {
  describe('setAssetCompatibleCapabilityTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0100
     * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0100
     * @tc.desc        supportedHighResolution is true
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0100', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0100';
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: true,
            };
            console.info(`${testNum} setAssetCompatibleCapability begin`);
            await helper.setAssetCompatibleCapability(cfg);
            console.info(`${testNum} setAssetCompatibleCapability succeed`);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0200
     * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0200
     * @tc.desc        supportedHighResolution is false
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0200', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0200';
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: false,
            };
            await helper.setAssetCompatibleCapability(cfg);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0300
     * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0300
     * @tc.desc        supportedHighResolution is undefined, error code is: 23800151
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0300', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0300';
        let abnormalResolution: ESObject = undefined;
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: abnormalResolution,
            };
            await helper.setAssetCompatibleCapability(cfg);
            expect().assertFail();
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(Number(error.code)).assertEqual(23800151);
            done();
        }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0400
     * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0400
     * @tc.desc        supportedHighResolution is null, error code is: 23800151
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 2
     */
    it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0400', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0400';
        let abnormalResolution: ESObject = null;
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: abnormalResolution,
            };
            await helper.setAssetCompatibleCapability(cfg);
            expect().assertFail();
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(Number(error.code)).assertEqual(23800151);
            done();
        }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0500
     * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0500
     * @tc.desc        supportedHighResolution is true twice
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0500', Level.LEVEL1, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0500';
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: true,
            };
            await helper.setAssetCompatibleCapability(cfg);
            await helper.setAssetCompatibleCapability(cfg);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0600
     * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0600
     * @tc.desc        supportedHighResolution is false twice
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0600', Level.LEVEL1, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0600';
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: false,
            };
            await helper.setAssetCompatibleCapability(cfg);
            await helper.setAssetCompatibleCapability(cfg);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0700
     * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0700
     * @tc.desc        supportedHighResolution is false and true
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 1
     */
    it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0700', Level.LEVEL1, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0700';
        try {
            let firstCfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: false,
            };
            let secondCfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: true,
            };
            await helper.setAssetCompatibleCapability(firstCfg);
            await helper.setAssetCompatibleCapability(secondCfg);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0800
     * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0800
     * @tc.desc        supportedHighResolution is false and supportedMimeType is image/heic
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0800', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0800';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/heic']
          };
          await helper.setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0900
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0900
       * @tc.desc        supportedHighResolution is true and supportedMimeType is image/jpeg
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0900', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0900';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
            supportedMimeType : ['image/jpeg']
          };
          await helper.setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1000
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1000
       * @tc.desc        supportedHighResolution is false and supportedMimeType is image/jpeg + image/heic
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1000', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1000';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/jpeg', 'image/heic']
          };
          await helper.setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1100
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1100
       * @tc.desc        supportedHighResolution is true and supportedMimeType is 3 image/jpeg + 3 image/heic
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 2
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1100', Level.LEVEL2, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1100';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
            supportedMimeType : ['image/jpeg', 'image/heic', 'image/jpeg', 'image/heic', 'image/jpeg', 'image/heic']
          };
          await helper.setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1200
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1200
       * @tc.desc        supportedHighResolution is false and supportedMimeType is image/jpeg + image/heic + image/png
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1200', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1200';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/jpeg', 'image/heic', 'image/png']
          };
          await helper.setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1300
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1300
       * @tc.desc        supportedHighResolution is false and supportedMimeType is undefined
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1300', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1300';
        try {
          let abnormalResolution: ESObject = undefined;
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : abnormalResolution
          };
          await helper.setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1400
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1400
       * @tc.desc        config is undefined
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1400', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1400';
        try {
          let cfg: ESObject = undefined;
          await helper.setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1500
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1500
       * @tc.desc        supportedHighResolution is false and supportedMimeType is null
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1500', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1500';
        try {
          let abnormalResolution: ESObject = null;
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : abnormalResolution
          };
          await helper.setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1600
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1600
       * @tc.desc        config is null
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1600', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1600';
        try {
          let cfg: ESObject = null;
          await helper.setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1700
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1700
       * @tc.desc        supportedHighResolution is false and supportedMimeType is []
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1700', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1700';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : []
          };
          await helper.setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1800
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1800
       * @tc.desc        supportedHighResolution is false and supportedMimeType is ['']
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1800', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1800';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['']
          };
          await helper.setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1900
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1900
       * @tc.desc        supportedHighResolution is false and supportedMimeType is ['   ']
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 0
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1900', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_1900';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['   ']
          };
          await helper.setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_2000
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_2000
       * @tc.desc        supportedHighResolution is true and supportedMimeType is heic then jpeg then heic
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 1
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_2000', Level.LEVEL1, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_2000';
        try {
          let firstCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
            supportedMimeType : ['image/heic']
          };
          let secondCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
            supportedMimeType : ['image/jpeg']
          };
          await helper.setAssetCompatibleCapability(firstCfg);
          await helper.setAssetCompatibleCapability(secondCfg);
          await helper.setAssetCompatibleCapability(firstCfg);
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      })
  
      /**
       * @tc.number      SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_2100
       * @tc.name        SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_2100
       * @tc.desc        supportedHighResolution is false and supportedMimeType is heic + jpeg then jpeg
       * @tc.size        MediumTest
       * @tc.type        Function
       * @tc.level       Level 1
       */
      it('SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_2100', Level.LEVEL1, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_2100';
        try {
          let firstCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/heic', 'image/jpeg']
          };
          let secondCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/jpeg']
          };
          await helper.setAssetCompatibleCapability(firstCfg);
          await helper.setAssetCompatibleCapability(secondCfg);
          done();
        } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
        }
      })

  })
}
