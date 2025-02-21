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

function generateKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.generateKeyItem(srcKeyAlies, HuksOptions, function (error, data) {
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

function init(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.initSession(srcKeyAlies, HuksOptions, function (error, data) {
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

function updateSession(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.updateSession(handle, HuksOptions, function (error, data) {
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

function finish(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.finishSession(handle, HuksOptions, function (error, data) {
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

function abort(handle, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.abortSession(handle, HuksOptions, function (error, data) {
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

function deleteKey(srcKeyAlies, HuksOptions) {
  return new Promise((resolve, reject) => {
    try {
      huks.deleteKeyItem(srcKeyAlies, HuksOptions, function (error, data) {
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

async function publicHmacUpdate(HuksOptions) {
  let dateSize = 64 * 1024;
  let huksOptionsInData = HuksOptions.inData;
  let inDataArray = stringToArray(HuksOptions.inData);

  if (HuksOptions.inData.length <= dateSize) {
    HuksOptions.inData = new Uint8Array(inDataArray);
    console.info(`enter callback doUpdate`);
    try {
      await updateSession(handle, HuksOptions)
        .then((data) => {
          console.info(`callback: doUpdate success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`callback: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`callback: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
    HuksOptions.inData = huksOptionsInData;
  } else {
    let count = Math.floor(inDataArray.length / dateSize);
    let remainder = inDataArray.length % dateSize;
    for (let i = 0; i < count; i++) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1))
      );
      try {
        await updateSession(handle, HuksOptions)
          .then((data) => {
            console.info(`callback: doUpdate success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`callback: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
            expect(null).assertFail();
          });
      } catch (error) {
        console.error(`callback: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }
    }
    if (remainder !== 0) {
      HuksOptions.inData = new Uint8Array(
        stringToArray(huksOptionsInData).slice(
          dateSize * count,
          inDataArray.length
        )
      );
      console.log(`test update HuksOptions.inData ${HuksOptions.inData}`);
      try {
        await updateSession(handle, HuksOptions)
          .then((data) => {
            console.info(`callback: doUpdate success, data = ${JSON.stringify(data)}`);
          })
          .catch(error => {
            console.error(`callback: doUpdate failed, code: ${error.code}, msg: ${error.message}`);
            expect(null).assertFail();
          });
      } catch (error) {
        console.error(`callback: doUpdate input arg invalid, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      }
    }
  }
}

async function publicHmacGenFunc(srcKeyAlies, HuksOptions, thirdInderfaceName) {
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  console.info(`enter callback generateKeyItem`);
  try {
    await generateKey(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback: generateKeyItem success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: generateKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: generateKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }

  HuksOptions.properties.splice(1, 1);
  try {
    await init(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback1: doInit success, data = ${JSON.stringify(data)}`);
        handle = data.handle;
      })
      .catch((error) => {
        console.error(`callback1: doInit failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: doInit input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
  await publicHmacUpdate(HuksOptions);

  if (thirdInderfaceName == "finish") {
    HuksOptions.inData = new Uint8Array(stringToArray("0"));
    try {
      await finish(handle, HuksOptions)
        .then((data) => {
          console.info(`callback: doFinish success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`callback: doFinish failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`callback: doFinish input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  } else {
    try {
      await abort(handle, HuksOptions)
        .then((data) => {
          console.info(`callback: doAbort success, data = ${JSON.stringify(data)}`);
        })
        .catch(error => {
          console.error(`callback: doAbort failed, code: ${error.code}, msg: ${error.message}`);
          expect(null).assertFail();
        });
    } catch (error) {
      console.error(`callback: doAbort input arg invalid, code: ${error.code}, msg: ${error.message}`);
      expect(null).assertFail();
    }
  }
  HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
  try {
    await deleteKey(srcKeyAlies, HuksOptions)
      .then((data) => {
        console.info(`callback: deleteKeyItem key success, data = ${JSON.stringify(data)}`);
      })
      .catch(error => {
        console.error(`callback: deleteKeyItem failed, code: ${error.code}, msg: ${error.message}`);
        expect(null).assertFail();
      });
  } catch (error) {
    console.error(`callback: deleteKeyItem input arg invalid, code: ${error.code}, msg: ${error.message}`);
    expect(null).assertFail();
  }
}

export function SecurityHuksHmacCallbackJsunit() {
  describe("SecurityHuksHmacCallbackJsunit", function () {
    it("testReformedHmacSHA256001", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA256KeyAlias001";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData63Kb,
      };

      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });

    it("testReformedHmacSHA256002", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA256KeyAlias002";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData63Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
    it("testReformedHmacSHA256003", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA256KeyAlias003";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });
    it("testReformedHmacSHA256004", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSHA256KeyAlias004";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSHA256
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
    it("testReformedHmacSM3001", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias001";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData63Kb,
      };

      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });

    it("testReformedHmacSM3002", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias002";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData63Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
    it("testReformedHmacSM3003", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias003";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "finish");
      done();
    });
    it("testReformedHmacSM3004", 0, async function (done) {
      let srcKeyAlies = "testHmacDigestSM3KeyAlias004";
      let HuksOptions = {
        properties: new Array(
          HuksHmac.HuksKeyAlg,
          HuksHmac.HuksKeyPurpose,
          HuksHmac.HuksTagDigestSM3
        ),
        inData: srcData65Kb,
      };
      await publicHmacGenFunc(srcKeyAlies, HuksOptions, "abort");
      done();
    });
  });
}
