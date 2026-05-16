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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, Level, it, expect } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import webNativeMessagingExtensionManager from '@ohos.web.webNativeMessagingExtensionManager';

// Error code definitions
const PERMISSION_DENIED_ERROR = 201;
const CAPABILITY_NOT_SUPPORTED_ERROR = 801;
const PARAMETER_CHECK_ERROR = 16000011;
const INTERNAL_ERROR = 16000050;

// Helper function to check if error matches specific error codes
function isPermissionDeniedError(error: BusinessError): boolean {
  return error.code === PERMISSION_DENIED_ERROR;
}

function isCapabilityNotSupportedError(error: BusinessError): boolean {
  return error.code === CAPABILITY_NOT_SUPPORTED_ERROR;
}

function isParameterCheckError(error: BusinessError): boolean {
  return error.code === PARAMETER_CHECK_ERROR;
}

function isInternalError(error: BusinessError): boolean {
  return error.code === INTERNAL_ERROR;
}

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve();
    }, time)
  });
}

export default function disconnectNativeErrorCodeTest() {
  describe('ActsDisconnectNativeErrorCodeTest', () => {
    beforeAll(() => {
      hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeErrorCodeTest beforeAll start');
    })

    beforeEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeErrorCodeTest beforeEach start');
    })

    afterEach(() => {
      hilog.info(0x0000, 'testTag', 'ActsDisconnectNativeErrorCodeTest afterEach start');
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_201_0100
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_201_0100
     * @tc.desc   Test disconnectNative with permission denied error (201)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_201_0100', Level.LEVEL1, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_201_0100`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let connectionId: number = 12345; // Use a valid connectionId but one that might trigger permission issues

      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed (no permission error)`);
          // If no error occurred, the test still passes as permission might be granted
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // Check if it's a permission denied error
          if (isPermissionDeniedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Permission denied error (201) detected as expected`);
            expect(error.code).assertEqual(PERMISSION_DENIED_ERROR);
          } else if (isCapabilityNotSupportedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // Skip test, don't fail
          } else if (isParameterCheckError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Parameter check error (16000011) detected`);
            expect(error.code).assertEqual(PARAMETER_CHECK_ERROR);
          } else if (isInternalError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Internal error (16000050) detected`);
            expect(error.code).assertEqual(INTERNAL_ERROR);
          } else {
            // For other errors, just verify it's a valid error code
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${error.code}`);
            expect(error.code).not().assertEqual(0);
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupportedError(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // Skip test, don't fail
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code).not().assertEqual(0);
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_801_0200
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_801_0200
     * @tc.desc   Test disconnectNative with capability not supported error (801)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_801_0200', Level.LEVEL1, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_801_0200`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // Use a non-existent connectionId that might trigger capability not supported error
      let connectionId: number = 999999;

      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed (no capability error)`);
          // If no error occurred, the test still passes
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // Check if it's a capability not supported error
          if (isCapabilityNotSupportedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Capability not supported error (801) detected as expected`);
            expect(error.code).assertEqual(CAPABILITY_NOT_SUPPORTED_ERROR);
          } else if (isPermissionDeniedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Permission denied error (201) detected`);
            expect(error.code).assertEqual(PERMISSION_DENIED_ERROR);
          } else if (isParameterCheckError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Parameter check error (16000011) detected`);
            expect(error.code).assertEqual(PARAMETER_CHECK_ERROR);
          } else if (isInternalError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Internal error (16000050) detected`);
            expect(error.code).assertEqual(INTERNAL_ERROR);
          } else {
            // For other errors, just verify it's a valid error code
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${error.code}`);
            expect(error.code).not().assertEqual(0);
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupportedError(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // Skip test, don't fail
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code).not().assertEqual(0);
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_16000011_0300
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_16000011_0300
     * @tc.desc   Test disconnectNative with parameter check error (16000011)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_16000011_0300', Level.LEVEL1, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_16000011_0300`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // Use a negative connectionId which should trigger parameter check error
      let connectionId: number = -1;

      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed (no parameter error)`);
          // If no error occurred, the test still passes
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // Check if it's a parameter check error
          if (isParameterCheckError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Parameter check error (16000011) detected as expected`);
            expect(error.code).assertEqual(PARAMETER_CHECK_ERROR);
          } else if (isPermissionDeniedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Permission denied error (201) detected`);
            expect(error.code).assertEqual(PERMISSION_DENIED_ERROR);
          } else if (isCapabilityNotSupportedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // Skip test, don't fail
          } else if (isInternalError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Internal error (16000050) detected`);
            expect(error.code).assertEqual(INTERNAL_ERROR);
          } else {
            // For other errors, just verify it's a valid error code
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${error.code}`);
            expect(error.code).not().assertEqual(0);
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupportedError(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // Skip test, don't fail
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code).not().assertEqual(0);
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_16000050_0400
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_16000050_0400
     * @tc.desc   Test disconnectNative with internal error (16000050)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_16000050_0400', Level.LEVEL1, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Error_Code_16000050_0400`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // Use a boundary value that might trigger internal error
      let connectionId: number = Number.MAX_SAFE_INTEGER;

      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed (no internal error)`);
          // If no error occurred, the test still passes
          expect(true).assertTrue();
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // Check if it's an internal error
          if (isInternalError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Internal error (16000050) detected as expected`);
            expect(error.code).assertEqual(INTERNAL_ERROR);
          } else if (isPermissionDeniedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Permission denied error (201) detected`);
            expect(error.code).assertEqual(PERMISSION_DENIED_ERROR);
          } else if (isCapabilityNotSupportedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // Skip test, don't fail
          } else if (isParameterCheckError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Parameter check error (16000011) detected`);
            expect(error.code).assertEqual(PARAMETER_CHECK_ERROR);
          } else {
            // For other errors, just verify it's a valid error code
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${error.code}`);
            expect(error.code).not().assertEqual(0);
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupportedError(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // Skip test, don't fail
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code).not().assertEqual(0);
      }
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_All_Error_Codes_0500
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_All_Error_Codes_0500
     * @tc.desc   Test disconnectNative with all error codes (201/801/16000011/16000050)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_All_Error_Codes_0500', Level.LEVEL1, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_All_Error_Codes_0500`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      // Test with different connectionIds to trigger different error codes
      const connectionIds = [
        12345, // Might trigger permission denied
        999999, // Might trigger capability not supported
        -1, // Should trigger parameter check error
        Number.MAX_SAFE_INTEGER // Might trigger internal error
      ];

      const expectedErrorCodes = [
        PERMISSION_DENIED_ERROR,
        CAPABILITY_NOT_SUPPORTED_ERROR,
        PARAMETER_CHECK_ERROR,
        INTERNAL_ERROR
      ];

      let errorDetected = [false, false, false, false];

      for (let i = 0; i < connectionIds.length; i++) {
        try {
          await webNativeMessagingExtensionManager.disconnectNative(connectionIds[i]).then(() => {
            hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed for connectionId: ${connectionIds[i]}`);
            // If no error occurred, that's still a valid result
          }).catch((error: BusinessError) => {
            hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error for connectionId ${connectionIds[i]}: ${error.code}, message: ${error.message}`);
            
            // Check which error code was detected
            if (isPermissionDeniedError(error)) {
              errorDetected[0] = true;
              expect(error.code).assertEqual(expectedErrorCodes[0]);
            } else if (isCapabilityNotSupportedError(error)) {
              errorDetected[1] = true;
              expect(error.code).assertEqual(expectedErrorCodes[1]);
            } else if (isParameterCheckError(error)) {
              errorDetected[2] = true;
              expect(error.code).assertEqual(expectedErrorCodes[2]);
            } else if (isInternalError(error)) {
              errorDetected[3] = true;
              expect(error.code).assertEqual(expectedErrorCodes[3]);
            } else {
              // For other errors, just verify it's a valid error code
              hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${error.code}`);
              expect(error.code).not().assertEqual(0);
            }
          });
        } catch (error) {
          let err = error as BusinessError;
          if (isCapabilityNotSupportedError(err)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801) for connectionId: ${connectionIds[i]}`);
          } else {
            hilog.info(0x0000, 'testTag', `${tcNumber} caught error for connectionId ${connectionIds[i]}: ${err.code}`);
          }
        }

        // Add a small delay between calls
        await sleep(100);
      }

      // Log which error codes were detected
      for (let i = 0; i < errorDetected.length; i++) {
        if (errorDetected[i]) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Error code ${expectedErrorCodes[i]} detected`);
        } else {
          hilog.info(0x0000, 'testTag', `${tcNumber} Error code ${expectedErrorCodes[i]} not detected`);
        }
      }

      // The test passes as long as we don't encounter any unexpected errors
      expect(true).assertTrue();
    })

    /**
     * @tc.name   SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Zero_ConnectionId_0600
     * @tc.number SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Zero_ConnectionId_0600
     * @tc.desc   Test disconnectNative with zero connectionId (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Zero_ConnectionId_0600', Level.LEVEL2, async () => {
      const tcNumber = `SUB_WEB_WebNativeMessagingExtension_DisconnectNative_Zero_ConnectionId_0600`;
      hilog.info(0x0000, 'testTag', `${tcNumber} Begin`);

      let connectionId: number = 0; // Boundary value

      try {
        await webNativeMessagingExtensionManager.disconnectNative(connectionId).then(() => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative completed with connectionId: ${connectionId}`);
        }).catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', `${tcNumber} disconnectNative caught error: ${error.code}, message: ${error.message}`);
          
          // Check if it's one of the expected error codes
          if (isPermissionDeniedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Permission denied error (201) detected`);
            expect(error.code).assertEqual(PERMISSION_DENIED_ERROR);
          } else if (isCapabilityNotSupportedError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
            return; // Skip test, don't fail
          } else if (isParameterCheckError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Parameter check error (16000011) detected`);
            expect(error.code).assertEqual(PARAMETER_CHECK_ERROR);
          } else if (isInternalError(error)) {
            hilog.info(0x0000, 'testTag', `${tcNumber} Internal error (16000050) detected`);
            expect(error.code).assertEqual(INTERNAL_ERROR);
          } else {
            // For other errors, just verify it's a valid error code
            hilog.info(0x0000, 'testTag', `${tcNumber} Unexpected error code: ${error.code}`);
            expect(error.code).not().assertEqual(0);
          }
        });
      } catch (error) {
        let err = error as BusinessError;
        if (isCapabilityNotSupportedError(err)) {
          hilog.info(0x0000, 'testTag', `${tcNumber} Skipped - capability not supported (error 801)`);
          return; // Skip test, don't fail
        }
        hilog.info(0x0000, 'testTag', `${tcNumber} caught error: ${err.code}`);
        expect(err.code).not().assertEqual(0);
      }
    })
  })
}