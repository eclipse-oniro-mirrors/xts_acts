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

import { describe, it, expect } from "@ohos/hypium";
import huks from "@ohos.security.huks";
import Data from "../../../../../../utils/data.json";
import { HuksHmac } from "../../../../../../utils/param/hmac/publicHmacParam.js";
import { stringToArray } from "../../../../../../utils/param/publicFunc.js";

var handle;
let srcData63Kb = Data.Date63KB;
let srcData65Kb = Data.Date65KB;
let emptyOptions = { properties: [] };

async function publicHmacGenFunc(srcKeyAlies, HuksOptions) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await huks
    .generateKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test generateKey data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error("test generateKey err information: " + JSON.stringify(err));
      expect(null).assertFail();
    });

  await huks
    .getKeyProperties(srcKeyAlies, HuksOptions)
    .then(async (data) => {
      console.log(`test finish data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error("test init err: " + JSON.stringify(err));
      expect(null).assertFail();
    });

  await getKeyProperties(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log("test generateKey data: " + JSON.stringify(data));
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.error("test init err: " + JSON.stringify(err));
      expect(null).assertFail();
    });

  await huks
    .isKeyExist(srcKeyAlies, emptyOptions)
    .then(async (data) => {
      console.log("isKeyExist data: " + JSON.stringify(data));
      expect(data == true).assertTrue();
    })
    .catch((err) => {
      console.error("isKeyExist err: " + JSON.stringify(err));
      expect(null).assertFail();
    });

  await isKeyExist(srcKeyAlies, emptyOptions)
    .then((data) => {
      console.log("isKeyExist data: " + JSON.stringify(data));
      expect(data == true).assertTrue();
    })
    .catch((err) => {
      console.error("isKeyExist err: " + JSON.stringify(err));
      expect(null).assertFail();
    });
  HuksOptions.properties.splice(1, 1);
}

function getKeyProperties(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    huks.getKeyProperties(srcKeyAlies, HuksOptions, function (err, data) {
      try {
        if (err.code != 0) {
          console.error(
            "test generateKey err information: " + JSON.stringify(err)
          );
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.error(
          "test generateKey err information:: " + JSON.stringify(e)
        );
        reject(e);
      }
    });
  });
}

function isKeyExist(srcKeyAlies, emptyOptions) {
  return new Promise((resolve, reject) => {
    huks.isKeyExist(srcKeyAlies, emptyOptions, function (err, data) {
      try {
        if (err.code != 0) {
          console.error(
            "test isKeyExist err information: " + JSON.stringify(err)
          );
          reject(err);
        } else {
          resolve(data);
        }
      } catch (e) {
        console.error("test isKeyExist err information: " + JSON.stringify(e));
        reject(e);
      }
    });
  });
}

async function publicHmacInitFunc(srcKeyAlies, HuksOptions) {
  await huks
    .init(srcKeyAlies, HuksOptions)
    .then(async (data) => {
      handle = data.handle;
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log(`test init err: " + ${JSON.stringify(err)}`);
      expect(null).assertFail();
    });
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
    await huks
      .finish(handle, HuksOptions)
      .then((data) => {
        console.log(`test finish data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
      })
      .catch((err) => {
        console.log("test finish err information: " + err);
        expect(null).assertFail();
      });
  } else if (thirdInderfaceName == "abort") {
    await huks
      .abort(handle, HuksOptions)
      .then((data) => {
        console.log(`test abort data ${JSON.stringify(data)}`);
        expect(data.errorCode == 0).assertTrue();
      })
      .catch((err) => {
        console.log("test abort err information: " + err);
        expect(null).assertFail();
      });
  }
}

async function publicHmacDelete(srcKeyAlies, HuksOptions) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  await huks
    .deleteKey(srcKeyAlies, HuksOptions)
    .then((data) => {
      console.log(`test deleteKey data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log("test deleteKey err information: " + JSON.stringify(err));
      expect(null).assertFail();
    });
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
  await huks
    .update(handle, HuksOptions)
    .then(async (data) => {
      console.log(`test update data ${JSON.stringify(data)}`);
      expect(data.errorCode == 0).assertTrue();
    })
    .catch((err) => {
      console.log("test update err information: " + err);
      expect(null).assertFail();
    });
}

export default function SecurityHuksHmacBasicPromiseJsunit() {
  describe("SecurityHuksHmacBasicPromiseJsunit", function () {
    it("Security_HUKS_Hmac_API8_101", 0, async function (done) {
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

    it("Security_HUKS_Hmac_API8_102", 0, async function (done) {
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

    it("Security_HUKS_Hmac_API8_103", 0, async function (done) {
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

    it("Security_HUKS_Hmac_API8_104", 0, async function (done) {
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

    it("Security_HUKS_Hmac_API8_SM3_101", 0, async function (done) {
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

    it("Security_HUKS_Hmac_API8_SM3_102", 0, async function (done) {
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

    it("Security_HUKS_Hmac_API8_SM3_103", 0, async function (done) {
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

    it("Security_HUKS_Hmac_API8_SM3_104", 0, async function (done) {
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
