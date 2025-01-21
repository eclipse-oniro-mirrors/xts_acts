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

import { describe, it, expect } from "@ohos/hypium";
import huks from "@ohos.security.huks";
import Data from "../../../../../../../utils/data.json";
import { HuksHmac } from "../../../../../../../utils/param/hmac/publicHmacParam.js";
import { stringToArray } from "../../../../../../../utils/param/publicFunc.js";

var handle;
let srcData63Kb = Data.Date63KB;
let srcData65Kb = Data.Date65KB;
let emptyOptions = { properties: [] };

async function publicHmacGenFunc(srcKeyAlies, HuksOptions) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  console.info(`enter promise generateKeyItem`);
  try {
    await huks.generateKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: generateKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }

  try {
    huks.getKeyItemProperties(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: getKeyItemProperties success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: getKeyItemProperties failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: getKeyItemProperties input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }

  try {
    getKeyItemProperties(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: getKeyItemProperties success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: getKeyItemProperties failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: getKeyItemProperties input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
  HuksOptions.properties.splice(1, 1);
}

function getKeyItemProperties(keyAlias, huksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.getKeyItemProperties(keyAlias, huksOptions, function (error, data) {
        if (error) {
          reject(error);
        } else {
          resolve(data);
        }
      });
    } catch (error) {
      expect(null).assertFail();
    }
  });
}

async function publicHmacInitFunc(srcKeyAlies, HuksOptions) {
  console.info(`enter promise doInit`);
  try {
    await huks.initSession(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: doInit success, data = ${JSON.stringify(data)}`);
        handle = data.handle;
      })
      .catch(error => {
        console.error(`promise: doInit key failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicHmacUpdateFunc(HuksOptions) {
  let dateSize = 64 * 1024;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = stringToArray(HuksOptions.inData);
  if (inDataArray.length < dateSize) {
    HuksOptions.inData = new Uint8Array(inDataArray);
    await update(handle, HuksOptions);
    HuksOptions.inData = huksOptionsInData;
  } else {
    let count = Math.floor(inDataArray.length / dateSize);
    let remainder = inDataArray.length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1))
      );
      await update(handle, HuksOptions);
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(huksOptionsInData).slice(
          dateSize * count,
          inDataArray.length
        )
      );
      await update(handle, HuksOptions);
    }
  }
}

async function publicHmacFinish(HuksOptions, thirdInderfaceName) {
  if (thirdInderfaceName == "finish") {
    HuksOptions.inData = new Uint8Array(stringToArray("0"));
    console.info(`enter promise doFinish`);
    try {
      await huks.finishSession(handle, HuksOptions)
        .then((data) => {
          console.info(`promise: doFinish success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`promise: doFinish failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`promise: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  } else if (thirdInderfaceName == "abort") {
    console.info(`enter promise doAbort`);
    try {
      await huks.abortSession(handle, HuksOptions)
        .then((data) => {
          console.info(`promise: doAbort success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`promise: doAbort failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`promise: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  }
}

async function publicHmacDelete(srcKeyAlies, HuksOptions) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  console.info(`enter promise deleteKeyItem`);
  try {
    await huks.deleteKeyItem(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`promise: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

async function publicHmacFunc(srcKeyAlies, HuksOptions, thirdInderfaceName) {
  try {
    await publicHmacGenFunc(srcKeyAlies, HuksOptions);
    await publicHmacInitFunc(srcKeyAlies, HuksOptions);
    await publicHmacUpdateFunc(HuksOptions);
    await publicHmacFinish(HuksOptions, thirdInderfaceName);
    await publicHmacDelete(srcKeyAlies, HuksOptions);
  } catch (e) {
    expect(null).assertFail();
  }
}

async function update(handle, HuksOptions) {
  console.info(`enter promise doUpdate`);
  try {
    await huks.updateSession(handle, HuksOptions)
      .then((data) => {
        console.info(`promise: doUpdate success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`promise: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`promise: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

export default function SecurityHuksHmacBasicPromiseJsunit() {
  describe("SecurityHuksHmacBasicPromiseJsunit", function () {
    it("Security_HUKS_Hmac_API9_101", 0, async function (done) {
      const srcKeyAlies = "testHmacDigestSHA256KeyAlias101";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData63Kb,
      };
      await publicHmacFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });

    it("Security_HUKS_Hmac_API9_102", 0, async function (done) {
      const srcKeyAlies = "testHmacDigestSHA256KeyAlias102";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData63Kb,
      };
      await publicHmacFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });

    it("Security_HUKS_Hmac_API9_103", 0, async function (done) {
      const srcKeyAlies = "testHmacDigestSHA256KeyAlias103";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData65Kb,
      };
      await publicHmacFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });

    it("Security_HUKS_Hmac_API9_104", 0, async function (done) {
      const srcKeyAlies = "testHmacDigestSHA256KeyAlias104";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData65Kb,
      };
      await publicHmacFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
    it("testReformedHmacSHA384103", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA384KeyAlias003";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA384
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });
    it("testReformedHmacSHA512103", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA512KeyAlias003";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA512
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });
    it("Security_HUKS_Hmac_API9_SM3_101", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias001";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData63Kb,
      };

      await publicHmacFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });

    it("Security_HUKS_Hmac_API9_SM3_102", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias002";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData63Kb,
      };
      await publicHmacFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });

    it("Security_HUKS_Hmac_API9_SM3_103", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias003";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData65Kb,
      };
      await publicHmacFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });

    it("Security_HUKS_Hmac_API9_SM3_104", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias004";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData65Kb,
      };
      await publicHmacFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
  });
}
