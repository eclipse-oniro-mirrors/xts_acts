import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';

let TAG = 'ttt';
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();

let getPermission = async () => {
  console.info('getPermission is start');
  let context:common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext;
  atManager.requestPermissionsFromUser(context, ['ohos.permission.READ_PASTEBOARD'], (err:BusinessError, data:PermissionRequestResult) => {
    console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
    console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
  })
}

let sleep = (ms:number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = Driver.create();
    console.info('come in driveFn');
    console.info('driver is ${JSON.stringify(driver)}');
    await sleep(1000);
    let button = await driver.findComponent(ON.text('始终允许'));
    if (button) {
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button.click();
      await  sleep(1000);
    } else {
      let button1 = await driver.findComponent(ON.text('仅本次允许'));
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button1.click();
      await  sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
    return
  }
}

export default function SystemPasteboardCallbackTest() {
  describe('SystemPasteboardCallbackTest', () => {
    beforeAll(async (done:Function) => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      done();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    it('SUB_Pasteboard_Local_SDK_SystemPasteboardCallbackTest_0100', 0, (done:Function) => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_SystemPasteboardCallbackTest_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createPlainTextData('content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync();
      expect(systemPasteboard.hasDataSync()).assertEqual(false);
      try {
        systemPasteboard.setPasteData(pasteData, (err, data) => {
          if (err) {
            console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message + ',' + err.code);
            expect().assertFail();
          }
          expect(systemPasteboard.hasDataSync()).assertEqual(true);
          console.info(TAG + 'Succeeded in setting PasteData.');
          systemPasteboard.hasPasteData((err: BusinessError, data: boolean) => {
            if (err) {
              console.error(TAG + 'Failed to check the PasteData. Cause: ' + err.message + ',' + err.code);
              expect().assertFail();
            }
            expect(data).assertEqual(true);
            console.info(TAG + 'Succeeded in checking PasteData. Result: ' + data);
            systemPasteboard.getPasteData((err: BusinessError, pasteData: pasteboard.PasteData) => {
              if (err) {
                console.error(TAG + 'Failed to get PasteData. Cause: ' + err.message + ',' + err.code);
                expect().assertFail();
              }
              expect(pasteData.getPrimaryMimeType()).assertEqual('text/plain');
              expect(pasteData.getPrimaryText()).assertEqual('content');
              console.info(TAG + 'Succeeded in getting PasteData. Type: ' + pasteData.getPrimaryMimeType() + 'Text: ' + pasteData.getPrimaryText());
              systemPasteboard.clear((err, data) => {
                if (err) {
                  console.error(TAG + 'Failed to clear PasteData. Cause: ' + err.message + ',' + err.code);
                  expect().assertFail();
                }
                expect(systemPasteboard.hasDataSync()).assertEqual(false);
                console.info(TAG + 'Succeeded in clearing the PasteData.');
                console.info(TAG + '************ SUB_Pasteboard_Local_SDK_SystemPasteboardCallbackTest_0100 end ************')
                done();
              });
            });
          });
        });
      } catch (err) {
        console.info(TAG + 'PASTEBOARD ERR =  '+ err + ',code= ' + err.code + ',message= ' + err.message);
        expect().assertFail();
      }
    })

    it('SUB_Pasteboard_Local_SDK_PasteboardMimeTypes_0100', 0, async () => {
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardMimeTypes_0100 start ************')
      let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, 'content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      await systemPasteboard.setData(pasteData);
      let prop: pasteboard.PasteDataProperty = pasteData.getProperty();
      pasteData.setProperty(prop);
      console.info(TAG + 'PasteDataProperty mimetypes is: ' + prop.mimeTypes);
      expect(prop.mimeTypes.toString()).assertEqual('text/plain')
      console.info(TAG + '************ SUB_Pasteboard_Local_SDK_PasteboardMimeTypes_0100 end ************')
    })
  })
}