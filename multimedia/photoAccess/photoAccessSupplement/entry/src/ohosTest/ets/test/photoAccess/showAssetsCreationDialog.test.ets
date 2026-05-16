/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, Level, afterAll } from '@ohos/hypium';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { sleep, getPermission, driveFn } from '../common'
import common from '@ohos.app.ability.common';
import { JSON } from '@kit.ArkTS';

const TAG = 'xts.PhotoAccessHelpers';

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

export default function ShowAssetsCreationDialogMoreSuppTest() {
  describe('ShowAssetsCreationDialogMoreSuppTest', () => {
    let driver: Driver | undefined = undefined;
    beforeAll(async () => {
      AppStorage.setOrCreate<string>('testString', 'test');
      AppStorage.setOrCreate<number>('testNumber', 123);
      AppStorage.setOrCreate<Number[]>('testArray', [-1, 0, 1]);
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      driver = Driver.create();
      await sleep(1000);
    });
    afterAll(async () => {
      AppStorage.delete('testString');
      AppStorage.delete('testNumber');
      AppStorage.delete('testArray');
    })
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    let showAssetCreationDialogErrorTest =
      async (done: Function, testName: string, srcFileUris: ESObject,
        photoCreationConfigs: ESObject,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testName, 'Start');
          phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs)
            .then((result) => {
              console.info(TAG, testName, ` Success createAssetWithShortTermPermission`,
                JSON.stringify(result));
            }).catch((error: ESObject) => {
            console.error(TAG, testName, ` Failed showAssetCreationDialog`, error.code,
              JSON.stringify(error));
            callback(error.code);
          })
          await sleep(3000);
          let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
          await sleep(500);
          await power?.click();
          done();
        } catch (error) {
          console.info(TAG, testName, ` Failed showAssetCreationDialog`, error.code,
            JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }

    let showAssetCreationDialogErrorTest1 =
      async (done: Function, testName: string, srcFileUris: ESObject,
        photoCreationConfigs: ESObject,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testName, 'Start');
          phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs)
            .then((result) => {
              console.info(TAG, testName, ` Success createAssetWithShortTermPermission`,
                JSON.stringify(result));
            }).catch((error: ESObject) => {
            console.error(TAG, testName, ` Failed showAssetCreationDialog`, error.code,
              JSON.stringify(error));
            expect().assertFail();
          }).finally(() => {
            done();
          });
          await sleep(3000);
          let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
          await sleep(500);
          await power?.click();
        } catch (error) {
          console.info(TAG, testName, ` Failed showAssetCreationDialog`, error.code,
            JSON.stringify(error));
          callback(error.code);
          done();
        }
      }

    let createAssetWithShortTermPermissionErrorTest1 =
      async (done: Function, testName: string,
        photoCreationConfigs: photoAccessHelper.PhotoCreationConfig | null | undefined,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testName, 'Start');
          phAccessHelper.createAssetWithShortTermPermission(photoCreationConfigs).then((result) => {
            console.info(TAG, testName, ` Success createAssetWithShortTermPermission`, JSON.stringify(result));
          }).catch((error: ESObject) => {
            console.error(TAG, testName, ` Failed showAssetCreationDialog`, error.code, JSON.stringify(error));
            expect().assertFail();
          }).finally(() => {
            done();
          });
          await sleep(3000);
          let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
          await sleep(500);
          await power?.click();
        } catch (error) {
          console.info(TAG, testName, ` Failed showAssetCreationDialog`, error.code, JSON.stringify(error));
          callback(error.code);
          done();
        }
      }

    let createAssetWithShortTermPermissionErrorTest =
      async (done: Function, testName: string,
        photoCreationConfigs: photoAccessHelper.PhotoCreationConfig | null | undefined,
        callback: (errCode: number) => void) => {
        try {
          console.info(TAG, testName, '11111111111111111111111Start');
          phAccessHelper.createAssetWithShortTermPermission(photoCreationConfigs).then((result) => {
            console.info(TAG, testName, ` 11111111111111111111111Success createAssetWithShortTermPermission`,
              JSON.stringify(result));
          }).catch((error: ESObject) => {
            console.error(TAG, testName, ` 11111111111111111111111Failed showAssetCreationDialog`, error.code,
              JSON.stringify(error));
            callback(error.code);
          })
          await sleep(3000);
          let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
          await sleep(500);
          await power?.click();
          done();
        } catch (error) {
          console.error(TAG, testName, ` 11111111111111111111111111Failed showAssetCreationDialog`, error.code,
            JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0100
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0100";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'test2',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0200
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0200";
      let srcFileUris: Array<string> = [''];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0300
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0300";
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, null, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0400
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0400";
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, undefined, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0500
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0500
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0500";
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, [], photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })


    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0600
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0600
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0600", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0600";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: '',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0700
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0700
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0700", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0700";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: null as ESObject,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0800
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0800
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0800", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0800";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: undefined as ESObject,
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0900
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0900
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_0900";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'text.xts',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1000
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1000
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1000";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: '1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1100
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1100";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest.',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1200
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1200";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest\\',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1300
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1300";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest/',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1400
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1400";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest:',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1500
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1500
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1500";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest*',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1600
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1600
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1600", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1600";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest?',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1700
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1700
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1700", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1700";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest"',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1800
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1800
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1800", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1800";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest\'',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1900
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1900
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_1900";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest`',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2000
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2000
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2000";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest<',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2100
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2100
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2100";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest>',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2200
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2200
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2200";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest|',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2300
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2300
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2300";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest{',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2400
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2400
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2400";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest}',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2500
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2500
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2500";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest[',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2600
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2600
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2600", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2600";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest]',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2700
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2700
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2700", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2700";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest',
          fileNameExtension: ' ',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2800
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2800
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2800", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2800";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest',
          fileNameExtension: 'abc',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2900
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2900
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_2900";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: AppStorage.get('testNumber'),
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3000
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3000
     * @tc.desc    PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3000";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: AppStorage.get('testArray'),
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3100
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3100";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest',
          fileNameExtension: null as ESObject,
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3200
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3200";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest',
          fileNameExtension: undefined as ESObject,
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3300
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3300";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest',
          fileNameExtension: AppStorage.get('testArray') as ESObject,
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3400
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3400";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetCreationDialogTest',
          fileNameExtension: AppStorage.get('testNumber') as ESObject,
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3500
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3500
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3500";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.VIDEO,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })


    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3600
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3600
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3600", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3600";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'mp4',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3700
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3700
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3700", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3700";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: 100,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3800
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3800
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3800", Level.LEVEL0, async (done: Function) => {
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoType) + 1;
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3800";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: maxEnum,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3900
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3900
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_3900";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: 0,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4000
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4000
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4000";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: -1,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4100
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4100";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: -1000,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4200
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4200";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: null as ESObject,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4300
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4300";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: undefined as ESObject,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4400
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4400";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: AppStorage.get('testString') as ESObject,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4500
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4500
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4500";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: AppStorage.get('testArray') as ESObject,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4600
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4600
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4600", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4600";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT + 100,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4700
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4700
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4700", Level.LEVEL0, async (done: Function) => {
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoSubtype) + 1;
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4700";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: maxEnum,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4800
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4800
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4800", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4800";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: -1,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4900
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4900
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_4900";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT - 1000,
        }
      ];
      await showAssetCreationDialogErrorTest(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5200
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5200";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: AppStorage.get('testString')
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5300
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5300";
      let srcFileUris: Array<string> = ['123456'];
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: AppStorage.get('testArray')
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })


    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5400
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5400";
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, AppStorage.get('testNumber'), photoCreationConfigs,
        (errCode) => {
          expect(errCode).assertEqual(401);
        })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5500
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5500
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5500";
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'showAssetsCreationDialogTest',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await showAssetCreationDialogErrorTest1(done, testNum, AppStorage.get('testArray'), photoCreationConfigs,
        (errCode) => {
          expect(errCode).assertEqual(401);
        })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5600
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5600
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5600", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5600";
      let srcFileUris: Array<string> = ['123456'];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, AppStorage.get('testNumber') as ESObject,
        (errCode) => {
          expect(errCode).assertEqual(401);
        })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5700
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5700
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5700", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5700";
      let srcFileUris: Array<string> = ['123456'];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, AppStorage.get('testString') as ESObject,
        (errCode) => {
          expect(errCode).assertEqual(401);
        })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5800
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5800
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5800", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5800";
      let srcFileUris: Array<string> = ['123456'];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, AppStorage.get('testArray') as ESObject,
        (errCode) => {
          expect(errCode).assertEqual(401);
        })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5900
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5900
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_5900";
      let srcFileUris: Array<string> = ['123456'];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, null, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_6000
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_6000
     * @tc.desc     PhotoAccessHelper_showAssetsCreationDialog
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_6000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_SHOW_ASSET_CREATION_DIALOG_6000";
      let srcFileUris: Array<string> = ['123456'];
      await showAssetCreationDialogErrorTest1(done, testNum, srcFileUris, undefined, (errCode) => {
        expect(errCode).assertEqual(401);
      })
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0100
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0100";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: 0,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0200
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0200";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: -100,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0300
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0300";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: -1,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0400
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0400";
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoType) + 1;
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: maxEnum,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0500
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0500
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0500";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: 100,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0600
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0600
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0600", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0600";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: 2,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0700
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0700
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0700", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0700";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: -1,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0800
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0800
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0800", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0800";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: -100,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0900
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0900
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_0900";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: 100,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1000
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1000
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1000";
      let maxEnum = getEnumMaxValue(photoAccessHelper.PhotoSubtype) + 1;
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: maxEnum,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual("13900020");
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1100
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1100";
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, null, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })


    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1200
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1200";
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, undefined, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1300
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1300";
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, AppStorage.get('testNumber'), (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1400
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1400";
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, AppStorage.get('testString'), (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1500
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1500
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1500";
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, AppStorage.get('testArray'), (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1900
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1900
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_1900";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: AppStorage.get('testNumber'),
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_2000
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_2000
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_2000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_2000";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: AppStorage.get('testArray'),
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3700
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3700
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3700", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3700";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'abc',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3800
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3800
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3800", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3800";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: '',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3900
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3900
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_3900";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: null as ESObject,
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4000
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4000
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4000";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: undefined as ESObject,
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4100
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4100";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: AppStorage.get('testNumber') as ESObject,
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4200
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4200";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: AppStorage.get('testArray') as ESObject,
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4300
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4300
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4300", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4300";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: AppStorage.get('testArray') as ESObject,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4400
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4400
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4400", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4400";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: AppStorage.get('testNumber') as ESObject,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual('13900020');
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4500
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4500
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4500", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4500";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: null as ESObject,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4600
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4600
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4600", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4600";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: undefined as ESObject,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4700
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4700
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4700", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4700";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'mp4',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4800
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4800
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4800", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4800";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.VIDEO,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      });
    })


    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4900
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4900
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4900", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_4900";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: AppStorage.get('testString'),
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5000
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5000
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5000", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5000";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: AppStorage.get('testArray'),
        };
      await createAssetWithShortTermPermissionErrorTest1(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(401);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5100
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5100
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5100", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5100";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: null as ESObject,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      });
    })

    /**
     * @tc.number   SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5200
     * @tc.name     SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5200
     * @tc.desc     PhotoAccessHelper_createAssetWithShortTermPermission
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5200", Level.LEVEL0, async (done: Function) => {
      const testNum = "SUB_PHOTO_ACCESS_HELPER_CREATEASSETWITHSHORTTERMPERMISSION_5200";
      let photoCreationConfigs: photoAccessHelper.PhotoCreationConfig =
        {
          title: 'CREATEASSETWITHSHORTTERMPERMISSION',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: undefined as ESObject,
        };
      await createAssetWithShortTermPermissionErrorTest(done, testNum, photoCreationConfigs, (errCode) => {
        expect(errCode).assertEqual(14000011);
      });
    })


  })


}