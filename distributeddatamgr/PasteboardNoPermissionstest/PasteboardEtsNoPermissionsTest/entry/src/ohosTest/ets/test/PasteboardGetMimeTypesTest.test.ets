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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';

const TAG = "[ttt]"
let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
const color: ArrayBuffer = new ArrayBuffer(96);
let opts: image.InitializationOptions = {
  editable: true,
  pixelFormat: image.PixelMapFormat.RGBA_8888,
  size: { height: 4, width: 6 }
}
const WANT: Want = {
  bundleName: "com.acts.distributeddatamgr.pasteboardtest",
  abilityName: "com.acts.distributeddatamgr.pasteboardtest.MainAbility"
};

export default function PasteboardGetMimeTypesTest() {
  describe('PasteboardGetMimeTypesTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await systemPasteboard.clearData();
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0100
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0100
     * @tc.desc      : setData Verify the properties of the MIMETYPE_TEXT_PLAIN type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0100', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0100 start-----")
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'hello');
      await systemPasteboard.setData(pasteData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting PasteData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/plain');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0100 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0200
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0200
     * @tc.desc      : setData Verify the properties of the MIMETYPE_TEXT_HTML type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0200', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0200 start-----")
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_HTML, 'hello');
      await systemPasteboard.setData(pasteData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting PasteData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/html');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0200 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0300
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0300
     * @tc.desc      : setData Verify the properties of the MIMETYPE_TEXT_URI type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0300', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0300 start-----")
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_URI, 'hello');
      await systemPasteboard.setData(pasteData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting PasteData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/uri');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0300 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0400
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0400
     * @tc.desc      : setData Verify the properties of the MIMETYPE_PIXELMAP type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0400', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0400 start-----")
      let pasteData: pasteboard.PasteData;
      try {
        let pixelMap:image.PixelMap = await image.createPixelMap(color, opts)
        console.info(TAG + 'Succeeded in creating pixelmap.');
        pasteData= pasteboard.createData(pasteboard.MIMETYPE_PIXELMAP, pixelMap);
        await systemPasteboard.setData(pasteData).then(() => {
          expect(systemPasteboard.hasDataSync()).assertTrue();
          console.info(TAG + 'Succeeded in setting PasteData.');
        }).catch((err: BusinessError) => {
          console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message);
          expect().assertFail();
        });
      } catch (err) {
        console.error(TAG + `Failed to create pixelmap. code is ${err.code}, message is ${err.message}`);
      }
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('pixelMap');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0400 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0500
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0500
     * @tc.desc      : setData Verify the properties of the MIMETYPE_TEXT_WANT type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0500', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0500 start-----")
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_WANT, WANT);
      await systemPasteboard.setData(pasteData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting PasteData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/want');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0500 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0600
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0600
     * @tc.desc      : setData Verify the properties of the Customize type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0600', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0600 start-----")
      let pasteData: pasteboard.PasteData = pasteboard.createData("hello/test", new ArrayBuffer(256));
      await systemPasteboard.setData(pasteData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting PasteData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('hello/test');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0600 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0700
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0700
     * @tc.desc      : setUnifiedData Verify the properties of the plainTextData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0700', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0700 start-----")
      let plainTextData = new unifiedDataChannel.UnifiedData();
      let plainText = new unifiedDataChannel.PlainText();
      plainText.details = {
        Key:'Plaintext',
        Value:'Plaintext'
      };
      plainText.textContent = 'textContent';
      plainText.abstract = 'abstract';
      plainTextData.addRecord(plainText);
      await systemPasteboard.setUnifiedData(plainTextData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/plain');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0700 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0800
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0800
     * @tc.desc      : setUnifiedData Verify the properties of the hyperLinkData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0800', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0800 start-----")
      let hyperLinkData = new unifiedDataChannel.UnifiedData();
      let hyperLink = new unifiedDataChannel.Hyperlink();
      hyperLink.url = 'www.XXX.com';
      hyperLink.description = 'this is description';
      hyperLinkData.addRecord(hyperLink);
      await systemPasteboard.setUnifiedData(hyperLinkData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/plain');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0800 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0900
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0900
     * @tc.desc      : setUnifiedData Verify the properties of the htmlData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0900', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0900 start-----")
      let htmlData = new unifiedDataChannel.UnifiedData();
      let html = new unifiedDataChannel.HTML();
      html.htmlContent = '<div><p>标题</p></div>';
      html.plainContent = 'this is plainContent';
      htmlData.addRecord(html);
      await systemPasteboard.setUnifiedData(htmlData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/html');
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_0900 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1000
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1000
     * @tc.desc      : setUnifiedData Verify the properties of the fileData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1000', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1000 start-----")
      let fileData = new unifiedDataChannel.UnifiedData();
      let file = new unifiedDataChannel.File();
      file.details = {
        name: 'test',
        type: 'txt',
      };
      file.uri = 'schema://com.acts.distributeddatamgr.pasteboardtest/files/test.txt';
      fileData.addRecord(file);
      await systemPasteboard.setUnifiedData(fileData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/uri')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1000 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1100
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1100
     * @tc.desc      : setUnifiedData Verify the properties of the pixelMapData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1100', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1100 start-----")
      let pixelMap:image.PixelMap = await image.createPixelMap(color, opts);
      let pixelMapRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_PIXEL_MAP,pixelMap);
      let pixelMapData = new unifiedDataChannel.UnifiedData();
      let properties:unifiedDataChannel.UnifiedDataProperties = new unifiedDataChannel.UnifiedDataProperties();
      properties.shareOptions = unifiedDataChannel.ShareOptions.IN_APP;
      pixelMapData.properties = properties;
      pixelMapData.addRecord(pixelMapRecord);
      await systemPasteboard.setUnifiedData(pixelMapData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('pixelMap')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1100 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1200
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1200
     * @tc.desc      : setUnifiedData Verify the properties of the appItemData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1200', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1200 start-----")
      let appItemData = new unifiedDataChannel.UnifiedData();
      let appItem = new unifiedDataChannel.SystemDefinedAppItem();
      appItem.appId = 'MyAppId';
      appItem.appName = 'MyAppName';
      appItem.appIconId = 'MyAppIconId';
      appItem.appLabelId = 'MyAppLabelId';
      appItem.bundleName = 'MyBundleName';
      appItem.abilityName = 'MyAbilityName';
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      appItem.details = {
        appItemKey1: 123,
        appItemKey2: 'appItemValue',
        appItemKey3: u8Array,
      };
      appItemData.addRecord(appItem);
      await systemPasteboard.setUnifiedData(appItemData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('openharmony.app-item')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1200 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1300
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1300
     * @tc.desc      : setUnifiedData Verify the properties of the imageData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1300', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1300 start-----")
      let imageData = new unifiedDataChannel.UnifiedData();
      let image = new unifiedDataChannel.Image();
      image.imageUri = 'schema://com.acts.distributeddatamgr.pasteboardtest/files/test.jpg';
      imageData.addRecord(image);
      await systemPasteboard.setUnifiedData(imageData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/uri')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1300 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1400
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1400
     * @tc.desc      : setUnifiedData Verify the properties of the videoData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1400', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1400 start-----")
      let videoData = new unifiedDataChannel.UnifiedData();
      let video = new unifiedDataChannel.Video();
      video.videoUri = 'schema://com.acts.distributeddatamgr.pasteboardtest/files/test.mp4';
      videoData.addRecord(video);
      await systemPasteboard.setUnifiedData(videoData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/uri')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1400 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1500
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1500
     * @tc.desc      : setUnifiedData Verify the properties of the audioData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1500', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1500 start-----")
      let audioData = new unifiedDataChannel.UnifiedData();
      let audio = new unifiedDataChannel.Audio();
      audio.audioUri = 'schema://com.acts.distributeddatamgr.pasteboardtest/files/test.mp3';
      audioData.addRecord(audio);
      await systemPasteboard.setUnifiedData(audioData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/uri')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1500 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1600
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1600
     * @tc.desc      : setUnifiedData Verify the properties of the folderData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1600', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1600 start-----")
      let folderData = new unifiedDataChannel.UnifiedData();
      let folder = new unifiedDataChannel.Folder();
      folder.folderUri = 'schema://com.acts.distributeddatamgr.pasteboardtest/files/folder/';
      folderData.addRecord(folder);
      await systemPasteboard.setUnifiedData(folderData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/uri')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1600 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1700
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1700
     * @tc.desc      : setUnifiedData Verify the properties of the sysFormData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1700', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1700 start-----")
      let sysFormData = new unifiedDataChannel.UnifiedData();
      let form = new unifiedDataChannel.SystemDefinedForm();
      form.formId = 123456;
      form.formName = 'MyFormName';
      form.bundleName = 'MyBundleName';
      form.abilityName = 'MyAbilityName';
      form.module = 'MyModule';
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      form.details = {
        formKey1: 123,
        formKey2: 'formValue',
        formKey3: u8Array,
      };
      sysFormData.addRecord(form);
      await systemPasteboard.setUnifiedData(sysFormData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('openharmony.form')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1700 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1800
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1800
     * @tc.desc      : setUnifiedData Verify the properties of the appRecordData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1800', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1800 start-----")
      let appRecordData = new unifiedDataChannel.UnifiedData();
      let record = new unifiedDataChannel.ApplicationDefinedRecord();
      let u8Array = new Uint8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
      record.applicationDefinedType = 'ApplicationDefinedType';
      record.rawData = u8Array;
      appRecordData.addRecord(record);
      await systemPasteboard.setUnifiedData(appRecordData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('ApplicationDefinedType')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1800 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1900
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1900
     * @tc.desc      : setUnifiedData Verify the properties of the wantData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1900', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1900 start-----")
      let wantData = new unifiedDataChannel.UnifiedData();
      let object:Want = {
        bundleName: 'bundleName',
        abilityName: 'abilityName'
      }
      let wantRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.OPENHARMONY_WANT, object);
      wantData.addRecord(wantRecord)
      await systemPasteboard.setUnifiedData(wantData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('text/want')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_1900 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2000
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2000
     * @tc.desc      : setUnifiedData Verify the properties of the textData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2000', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2000 start-----")
      let textData = new unifiedDataChannel.UnifiedData();
      let text = new unifiedDataChannel.Text();
      text.details = {
        title: 'MyTitle',
        content: 'this is content',
      };
      textData.addRecord(text);
      await systemPasteboard.setUnifiedData(textData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('general.text')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2000 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2100
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2100
     * @tc.desc      : setUnifiedData Verify the properties of the arrayBufferData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2100', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2100 start-----")
      let arrayBufferData = new unifiedDataChannel.UnifiedData();
      let arrayBuffer = new unifiedDataChannel.ApplicationDefinedRecord;
      arrayBuffer.applicationDefinedType = 'ApplicationDefined-ARRAY_BUFFER_TYPE';
      arrayBuffer.rawData = new Uint8Array([1,2,3]);
      arrayBufferData.addRecord(arrayBuffer);
      await systemPasteboard.setUnifiedData(arrayBufferData).then(() => {
        expect(systemPasteboard.hasDataSync()).assertTrue();
        console.info(TAG + 'Succeeded in setting UnifiedData.');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'Failed to set UnifiedData. Cause: ' + err.message);
        expect().assertFail();
      });
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual('ApplicationDefined-ARRAY_BUFFER_TYPE')
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2100 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2200
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2200
     * @tc.desc      : setUnifiedData Verify the properties of the appRecordData type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2200', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2200 start-----")
      await systemPasteboard.getMimeTypes().then((data: Array<String>) => {
        expect(data[0]).assertEqual(undefined)
        console.info(TAG + 'Succeeded in getting mimeTypes. mimeTypes: ' + JSON.stringify(data));
      }).catch((err:BusinessError) => {
        console.error(TAG + 'Failed to get mimeTypes. Cause:' + err.message);
        expect().assertFail();
      })
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_getMimeTypes_2200 end-----")
    })
	
	/**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_setAppShareOptions_0100
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_setAppShareOptions_0100
     * @tc.desc      : setAppShareOptions Verify
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_setAppShareOptions_0100', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_setAppShareOptions_0100 start-----")
      try {
        systemPasteboard.setAppShareOptions(pasteboard.ShareOption.INAPP);
        console.info(TAG + 'Set app share options success.');
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual("201");
        console.info(TAG + `Set app share options failed, errorCode: ${err.code}, errorMessage: ${err.message}.`);
      }
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_setAppShareOptions_0100 end-----")
    })

    /**
     * @tc.name      : test_SUB_Pasteboard_Local_SDK_SystemPasteboard_removeAppShareOptions_0100
     * @tc.number    : SUB_Pasteboard_Local_SDK_SystemPasteboard_removeAppShareOptions_0100
     * @tc.desc      : removeAppShareOptions Verify
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Pasteboard_Local_SDK_SystemPasteboard_removeAppShareOptions_0100', 0, async () => {
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_removeAppShareOptions_0100 start-----")
      try {
        systemPasteboard.removeAppShareOptions();
        console.info(TAG + 'Remove app share options success.');
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual("201");
        console.info(TAG + `Remove app share options failed, errorCode: ${err.code}, errorMessage: ${err.message}.`);
      }
      console.info(TAG + "-----SUB_Pasteboard_Local_SDK_SystemPasteboard_removeAppShareOptions_0100 end-----")
    })

  })
}