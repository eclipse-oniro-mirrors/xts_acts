/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import account from '@ohos.account.appAccount'
import { describe, beforeAll, afterEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import Utils from './Util.test';

let tag: string = 'testTag';
let LENGTHLIMIT: int = 512;
let TOKENLENGTHLIMIT: int = 1024;
let AUTHTYPELENGTHLIMIT: int = 1024;
let OWNERLENGTHLIMIT: int = 1024;
let OWNERSELF: string = "com.example.actsaccountoperatetest.static";
let valid_owner_name: string = "com.example.actsaccountOauthtoken";

export default function ActsAccountAuthTokenStatic() {
  describe('ActsAccountAuthTokenStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    /**
     * @tc.number     ActsAccountAuthToken_9100
     * @tc.name       ActsAccountAuthToken_9100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9100 start====");
        accountManager.createAccount("account_tokenTest_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>9100 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_tokenTest_name", "authType1", "test_token1",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>9100 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthToken("account_tokenTest_name", "authType1", "test_token2",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>9100 setAuthToken err: " + JSON.stringify(err));
                  accountManager.setAuthTokenVisibility("account_tokenTest_name", "authType1", valid_owner_name, true,
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>9100 setAuthTokenVisibility err: " + JSON.stringify(err));
                      accountManager.setAuthToken("account_tokenTest_name", "authType2", "test_token2",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>9100 setAuthToken err: " + JSON.stringify(err));
                          accountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,
                            (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
                              hilog.info(0x0000, tag, "====>9100 getAllAuthTokens err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>9100 getAllAuthTokens data: " + data);
                              try {
                                if (err) {
                                  hilog.info(0x0000, tag, "====>run err");
                                  expect().assertFail();
                                } else {
                                  if (data) {
                                    expect(data?.length).assertEqual(2);
                                  } else {
                                    hilog.info(0x0000, tag, "====>run err");
                                    expect().assertFail();
                                  }
                                }
                              } catch (err) {
                                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                              }
                              accountManager.deleteAuthToken("account_tokenTest_name", OWNERSELF, "authType1",
                                "test_token2", (err: BusinessError<void> | null): void => {
                                  hilog.info(0x0000, tag, "====>9100 deleteAuthToken err: " + JSON.stringify(err));
                                  accountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,
                                    (err: BusinessError<void> | null,
                                      data: Array<account.AuthTokenInfo> | undefined): void => {
                                      hilog.info(0x0000, tag, "====>9100 getAllAuthTokens err: " + JSON.stringify(err));
                                      hilog.info(0x0000, tag, "====>9100 AuthTokens Data: " + data);
                                      try {
                                        if (err) {
                                          hilog.info(0x0000, tag, "====>run err");
                                          expect().assertFail();
                                        } else {
                                          if (data) {
                                            expect(data?.length).assertEqual(1);
                                          } else {
                                            hilog.info(0x0000, tag, "====>run err");
                                            expect().assertFail();
                                          }
                                        }
                                      } catch (err) {
                                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                                      }
                                      accountManager.removeAccount("account_tokenTest_name",
                                        (err: BusinessError<void> | null): void => {
                                          hilog.info(0x0000, tag, "====>9100 err: " + JSON.stringify(err));
                                          hilog.info(0x0000, tag, "====>9100 end====");
                                          accountManager.getAuthToken("account_tokenTest_name", OWNERSELF, "authType",
                                            (err: BusinessError<void> | null, data: string | undefined): void => {
                                              hilog.info(0x0000, tag, "====>9100 err: " + JSON.stringify(err));
                                              hilog.info(0x0000, tag, "====>9100 getAuthToken data: " + data);
                                              try {
                                                if (err) {
                                                  expect(err?.code).assertEqual(12300003);
                                                  hilog.info(0x0000, tag, "end====");
                                                } else {
                                                  hilog.info(0x0000, tag, "====>run err");
                                                  expect().assertFail();
                                                }
                                              } catch (err) {
                                                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                                              }
                                              hilog.info(0x0000, tag, "====>9100 end====");
                                              done();
                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_9000
     * @tc.name       ActsAccountAuthToken_9000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9000 start====");
        accountManager.createAccount("account_tokenTest_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>9000 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_tokenTest_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>9000 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_tokenTest_name", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>9000 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>9000 getAuthToken data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("test_token");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.setAuthTokenVisibility("account_tokenTest_name", "authType", valid_owner_name, true,
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>9000 setAuthTokenVisibility err: " + JSON.stringify(err));
                      accountManager.getAuthList("account_tokenTest_name", "authType",
                        (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                          hilog.info(0x0000, tag, "====>9000 getAuthList err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>9000 getAuthList data: " + JSON.stringify(data));
                          try {
                            if (err) {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            } else {
                              if (data) {
                                expect(data?.length).assertEqual(1);
                                let a: string = data[0];
                                expect(a).assertEqual(valid_owner_name);
                              } else {
                                hilog.info(0x0000, tag, "====>run err");
                                expect().assertFail();
                              }
                            }
                          } catch (err) {
                            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                          }
                          accountManager.deleteAuthToken("account_tokenTest_name", OWNERSELF, "authType", "test_token",
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>9000 deleteAuthToken err: " + JSON.stringify(err));
                              accountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,
                                (err: BusinessError<void> | null,
                                  data: Array<account.AuthTokenInfo> | undefined): void => {
                                  hilog.info(0x0000, tag, "====>9000 getAllAuthTokens err: " + JSON.stringify(err));
                                  hilog.info(0x0000, tag, "====>9000 getAllAuthTokens data: " + data);
                                  try {
                                    if (err) {
                                      hilog.info(0x0000, tag, "====>run err");
                                      expect().assertFail();
                                    } else {
                                      if (data) {
                                        expect(data?.length).assertEqual(0);
                                      } else {
                                        hilog.info(0x0000, tag, "====>run err");
                                        expect().assertFail();
                                      }
                                    }
                                  } catch (err) {
                                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                                  }
                                  accountManager.setAuthTokenVisibility("account_tokenTest_name", "authType", OWNERSELF,
                                    false,
                                    (err: BusinessError<void> | null): void => {
                                      hilog.info(0x0000, tag, "====>9000 err: " + JSON.stringify(err));
                                      try {
                                        if (err) {
                                          expect(err?.code).assertEqual(12300002);
                                        } else {
                                          hilog.info(0x0000, tag, "====>run err");
                                          expect().assertFail();
                                        }
                                      } catch (err) {
                                        hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                                      }
                                      accountManager.getAuthToken("account_tokenTest_name", OWNERSELF, "authType",
                                        (err: BusinessError<void> | null, data: string | undefined): void => {
                                          hilog.info(0x0000, tag, "====>9000 getAuthToken err: " + JSON.stringify(err));
                                          hilog.info(0x0000, tag, "====>9000 getAuthToken data: " + data);
                                          try {
                                            if (err) {
                                              expect(err?.code).assertEqual(12300107);
                                            } else {
                                              hilog.info(0x0000, tag, "====>run err");
                                              expect().assertFail();
                                            }
                                          } catch (err) {
                                            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                                          }
                                          accountManager.removeAccount("account_tokenTest_name",
                                            (err: BusinessError<void> | null): void => {
                                              hilog.info(0x0000, tag, "====>9000 err: " + JSON.stringify(err));
                                              hilog.info(0x0000, tag, "====>9000 end====");
                                              done();
                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_7100
     * @tc.name       ActsAccountAuthToken_7100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>7100 start====");
        hilog.info(0x0000, tag, "====>7100 createAccount start====");
        accountManager.createAccount("account_tokenTest_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>7100 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_tokenTest_name", "authType1", "test_token1",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>7100 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthToken("account_tokenTest_name", "authType1", "test_token2",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>7100 setAuthToken err: " + JSON.stringify(err));
                  accountManager.setAuthToken("account_tokenTest_name", "authType2", "test_token2",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>7100 setAuthToken err: " + JSON.stringify(err));
                      accountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,
                        (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
                          hilog.info(0x0000, tag, "====>7100 getAllAuthTokens err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>7100 getAllAuthTokens data: " + data);
                          try {
                            if (err) {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            } else {
                              if (data) {
                                expect(data?.length).assertEqual(2);
                                let a: string = data[0].authType;
                                let b: string = data[0].token;
                                let c: string = data[1].authType;
                                let d: string = data[1].token;
                                expect(a).assertEqual("authType1");
                                expect(b).assertEqual("test_token2");
                                expect(c).assertEqual("authType2");
                                expect(d).assertEqual("test_token2");
                              } else {
                                hilog.info(0x0000, tag, "====>run err");
                                expect().assertFail();
                              }
                            }
                          } catch (err) {
                            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                          }
                          accountManager.deleteAuthToken("account_tokenTest_name", OWNERSELF, "authType1",
                            "test_token2", (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>7100 deleteAuthToken err: " + JSON.stringify(err));
                              accountManager.getAllAuthTokens("account_tokenTest_name", OWNERSELF,
                                (err: BusinessError<void> | null,
                                  data: Array<account.AuthTokenInfo> | undefined): void => {
                                  hilog.info(0x0000, tag, "====>7100 getAllAuthTokens err: " + JSON.stringify(err));
                                  hilog.info(0x0000, tag, "====>7100 getAllAuthTokens data: " + data);
                                  try {
                                    if (err) {
                                      hilog.info(0x0000, tag, "====>run err");
                                      expect().assertFail();
                                    } else {
                                      if (data) {
                                        expect(data?.length).assertEqual(1);
                                        let a: string = data[0].authType;
                                        let b: string = data[0].token;
                                        expect(a).assertEqual("authType2");
                                        expect(b).assertEqual("test_token2");
                                      } else {
                                        hilog.info(0x0000, tag, "====>run err");
                                        expect().assertFail();
                                      }
                                    }
                                  } catch (err) {
                                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                                  }
                                  accountManager.removeAccount("account_tokenTest_name",
                                    (err: BusinessError<void> | null): void => {
                                      hilog.info(0x0000, tag, "====>7100 removeAccount err: " + JSON.stringify(err));
                                      accountManager.getAuthToken("account_tokenTest_name", OWNERSELF, "authType",
                                        (err: BusinessError<void> | null, data: string | undefined): void => {
                                          hilog.info(0x0000, tag, "====>7100 getAuthToken err: " + JSON.stringify(err));
                                          hilog.info(0x0000, tag, "====>7100 getAuthToken data: " + data);
                                          try {
                                            if (err) {
                                              expect(err?.code !== 0).assertTrue();
                                            } else {
                                              hilog.info(0x0000, tag, "====>run err");
                                              expect().assertFail();
                                            }
                                          } catch (err) {
                                            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                                          }
                                          hilog.info(0x0000, tag, "====>7100 end====");
                                          done();
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_7200
     * @tc.name       ActsAccountAuthToken_7200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>7200 start====");
        accountManager.createAccount("account_tokenTest_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>7200 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_tokenTest_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>7200 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_tokenTest_name", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>7200 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>7200 getAuthToken data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("test_token");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.getAuthList("account_tokenTest_name", "authType",
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>7200 getAuthList err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>7200 getAuthList data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data?.length).assertEqual(0);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_tokenTest_name",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>7200 removeAccount err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>7200 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_7300
     * @tc.name       ActsAccountAuthToken_7300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>7300 start====");
        hilog.info(0x0000, tag, "====>7300 createAccount start====");
        accountManager.createAccount("account_tokenTest_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>7300 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_tokenTest_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>7300 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_tokenTest_name", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>7300 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>7300 getAuthToken data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("test_token");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.checkAuthTokenVisibility("account_tokenTest_name", "authType", OWNERSELF,
                    (err: BusinessError<void> | null, data: boolean | undefined): void => {
                      hilog.info(0x0000, tag, "====>7300 checkAuthTokenVisibility err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>7300 checkAuthTokenVisibility data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual(true);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.setAuthTokenVisibility("account_tokenTest_name", "authType", OWNERSELF, false,
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>7300 setAuthTokenVisibility err: " + JSON.stringify(err));
                          try {
                            if (err) {
                              expect(err?.code).assertEqual(12300002);
                            } else {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            }
                          } catch (err) {
                            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                          }
                          accountManager.checkAuthTokenVisibility("account_tokenTest_name", "authType", OWNERSELF,
                            (err: BusinessError<void> | null, data: boolean | undefined): void => {
                              hilog.info(0x0000, tag, "====>7300 checkAuthTokenVisibility err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>7300 checkAuthTokenVisibility data: " + data);
                              try {
                                if (err) {
                                  hilog.info(0x0000, tag, "====>run err");
                                  expect().assertFail();
                                } else {
                                  if (data) {
                                    expect(data).assertEqual(true);
                                  } else {
                                    hilog.info(0x0000, tag, "====>run err");
                                    expect().assertFail();
                                  }
                                }
                              } catch (err) {
                                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                              }
                              accountManager.deleteAuthToken("account_tokenTest_name", OWNERSELF, "authType",
                                "test_token",
                                (err: BusinessError<void> | null): void => {
                                  hilog.info(0x0000, tag, "====>7300 deleteAuthToken err: " + JSON.stringify(err));
                                  try {
                                    expect(err).assertEqual(null);
                                  } catch (err) {
                                    hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                                  }
                                  accountManager.removeAccount("account_tokenTest_name",
                                    (err: BusinessError<void> | null): void => {
                                      hilog.info(0x0000, tag, "====>7300 removeAccount err: " + JSON.stringify(err));
                                      hilog.info(0x0000, tag, "====>7300 end====");
                                      done();
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_7400
     * @tc.name       ActsAccountAuthToken_7400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 'c';
        }
        hilog.info(0x0000, tag, "====>7400 start====");
        hilog.info(0x0000, tag, "====>7400 createAccount start====");
        accountManager.createAccount("account_callback_authType_limit", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>7400 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_authType_limit", "authType", "callback_authType_limit_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>7400 setAuthToken err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_authType_limit", OWNERSELF, limitAuthType,
                "callback_authType_limit_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>7400 getAuthToken err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300002);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_authType_limit",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>7400 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>7400 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_7500
     * @tc.name       ActsAccountAuthToken_7500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 'c';
        }
        hilog.info(0x0000, tag, "====>7500 start====");
        hilog.info(0x0000, tag, "====>7500 createAccount start====");
        await accountManager.createAccount("promise_authType_limit");
        hilog.info(0x0000, tag, "====>7500 getAuthToken start====");
        try {
          await accountManager.deleteAuthToken("promise_authType_limit", OWNERSELF, limitAuthType,
            "promise_authType_limit_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>7500 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>7500 removeAccount start====");
          await accountManager.removeAccount("promise_authType_limit");
          hilog.info(0x0000, tag, "====>7500 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_7600
     * @tc.name       ActsAccountAuthToken_7600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT; i++) {
          limitAuthType += 'c';
        }
        hilog.info(0x0000, tag, "====>7600 start====");
        hilog.info(0x0000, tag, "====>7600 createAccount start====");
        accountManager.createAccount("account_callback_authType_limit", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>7600 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_authType_limit", limitAuthType, "callback_authType_limit_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>7600 setAuthToken err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_authType_limit", OWNERSELF, limitAuthType,
                "callback_authType_limit_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>7600 getAuthToken err: " + JSON.stringify(err));
                  accountManager.removeAccount("account_callback_authType_limit",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>7600 removeAccount err: " + JSON.stringify(err));
                      try {
                        expect(err).assertEqual(null);
                      } catch (err) {
                        hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                      }
                      hilog.info(0x0000, tag, "====>7600 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_7700
     * @tc.name       ActsAccountAuthToken_7700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT; i++) {
          limitAuthType += 'c';
        }
        try {
          hilog.info(0x0000, tag, "====>7700 start====");
          hilog.info(0x0000, tag, "====>7700 createAccount start====");
          await accountManager.createAccount("promise_authType_limit")
          hilog.info(0x0000, tag, "====>7700 setAuthToken start====");
          await accountManager.setAuthToken("promise_authType_limit", limitAuthType,
            "promise_authType_limit_token");
          hilog.info(0x0000, tag, "====>7700 deleteAuthToken start====");
          await accountManager.deleteAuthToken("promise_authType_limit", OWNERSELF, limitAuthType,
            "promise_authType_limit_token")
          hilog.info(0x0000, tag, "====>7700 removeAccount start====");
          await accountManager.removeAccount("promise_authType_limit")
          hilog.info(0x0000, tag, "====>7700 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>7500 getAuthToken err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();

      });

    /**
     * @tc.number     ActsAccountAuthToken_7800
     * @tc.name       ActsAccountAuthToken_7800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>7800 start====");
        hilog.info(0x0000, tag, "====>7800 createAccount start====");
        accountManager.createAccount("account_callback_empty_authType", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>7800 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_empty_authType", "authType", "callback_empty_authType_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>7800 setAuthToken err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_empty_authType", OWNERSELF, "",
                "callback_empty_authType_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>7800 deleteAuthToken err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300107);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.getAuthToken("account_callback_empty_authType", OWNERSELF, "authType",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>7800 getAuthToken err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>7800 getAuthToken data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("callback_empty_authType_token");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_callback_empty_authType",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>7800 removeAccount err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>7800 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_7900
     * @tc.name       ActsAccountAuthToken_7900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>7900 start====");
        hilog.info(0x0000, tag, "====>7900 createAccount start====");
        await accountManager.createAccount("promise_empty_authType");
        hilog.info(0x0000, tag, "====>7900 setAuthToken start====");
        await accountManager.setAuthToken("promise_empty_authType", "authType", "promise_empty_authType_token");
        try {
          hilog.info(0x0000, tag, "====>7900 deleteAuthToken start====");
          await accountManager.deleteAuthToken("promise_empty_authType", OWNERSELF, "",
            "promise_empty_authType_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>7900 deleteAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>7900 getAuthToken start====");
          let data: string = await accountManager.getAuthToken("promise_empty_authType", OWNERSELF, "authType");
          expect(data).assertEqual("promise_empty_authType_token");
          hilog.info(0x0000, tag, "====>7900 removeAccount start====");
          await accountManager.removeAccount("promise_empty_authType");
          hilog.info(0x0000, tag, "====>7900 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_8000
     * @tc.name       ActsAccountAuthToken_8000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>8000 start====");
        hilog.info(0x0000, tag, "====>8000 createAccount start====");
        accountManager.createAccount("account_callback_setSameAuthType", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>8000 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_setSameAuthType", "authType", "callback_setSameAuthType_token1",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>8000 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthToken("account_callback_setSameAuthType", "authType",
                "callback_setSameAuthType_token2", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>8000 setAuthToken err: " + JSON.stringify(err));
                  accountManager.getAuthToken("account_callback_setSameAuthType", OWNERSELF, "authType",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>8000 getAuthToken err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>8000 getAuthToken data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("callback_setSameAuthType_token2");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.deleteAuthToken("account_callback_setSameAuthType", OWNERSELF, "authType",
                        "callback_setSameAuthType_token1",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>8000 deleteAuthToken err: " + JSON.stringify(err));
                          accountManager.removeAccount("account_callback_setSameAuthType",
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>8000 removeAccount err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>8000 end====");
                              done();
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8100
     * @tc.name       ActsAccountAuthToken_8100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 4
     */
    it('ActsAccountAuthToken_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitName: string = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitName += 'c';
        }
        hilog.info(0x0000, tag, "====>8100 start====");
        try {
          hilog.info(0x0000, tag, "====>8100 getAllAuthTokens start====");
          let data: Array<account.AuthTokenInfo> = await accountManager.getAllAuthTokens(limitName, OWNERSELF);
          hilog.info(0x0000, tag, "====>8100 run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>8100 getAllAuthTokens err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>8100====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_8200
     * @tc.name       ActsAccountAuthToken_8200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>8200 start====");
        hilog.info(0x0000, tag, "====>8200 getAllAuthTokens start====");
        accountManager.getAllAuthTokens("", OWNERSELF,
          (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
            hilog.info(0x0000, tag, "====>8200 getAllAuthTokens err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>8200 getAllAuthTokens data: " + data);
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
                hilog.info(0x0000, tag, "====>8200 ====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8300
     * @tc.name       ActsAccountAuthToken_8300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>8300 start====");
        hilog.info(0x0000, tag, "====>8300 getAllAuthTokens start====");
        accountManager.getAllAuthTokens("acount_no_setToken", OWNERSELF,
          (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
            hilog.info(0x0000, tag, "====>8300 getAllAuthTokens err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>8300 getAllAuthTokens data: " + data);
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
                hilog.info(0x0000, tag, "====>8300 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8400
     * @tc.name       ActsAccountAuthToken_8400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>8400 start====");
        hilog.info(0x0000, tag, "====>8400 createAccount start====");
        accountManager.createAccount("acount_no_setToken", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>8400 createAccount err: " + JSON.stringify(err));
          accountManager.getAllAuthTokens("acount_no_setToken", OWNERSELF,
            (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>8400 getAllAuthTokens err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>8400 getAllAuthTokens data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(0);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              accountManager.removeAccount("acount_no_setToken", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>8400 removeAccount err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>8400 end====");
                done();
              });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8500
     * @tc.name       ActsAccountAuthToken_8500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitName: string = '';
        for (let i: int = 0; i < LENGTHLIMIT; i++) {
          limitName += 'c';
        }
        hilog.info(0x0000, tag, "====>8500 start====");
        hilog.info(0x0000, tag, "====>8500 createAccount start====");
        accountManager.createAccount(limitName, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>8500 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken(limitName, "authType", "test_token", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>8500 setAuthToken err: " + JSON.stringify(err));
            accountManager.getAllAuthTokens(limitName, OWNERSELF,
              (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
                hilog.info(0x0000, tag, "====>8500 getAllAuthTokens err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>8500 getAllAuthTokens data: " + data);
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    if (data) {
                      expect(data?.length).assertEqual(1);
                      let a: string = data[0].authType;
                      let b: string = data[0].token;
                      expect(a).assertEqual("authType");
                      expect(b).assertEqual("test_token");
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  }
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                accountManager.removeAccount(limitName, (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>8500 removeAccount err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>8500 end====");
                  done();
                });
              });
          });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8600
     * @tc.name       ActsAccountAuthToken_8600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitOwner: string = '';
        for (let i: int = 0; i < OWNERLENGTHLIMIT + 1; i++) {
          limitOwner += 'c';
        }
        hilog.info(0x0000, tag, "====>8600 start====");
        hilog.info(0x0000, tag, "====>8600 createAccount start====");
        accountManager.createAccount("account_callback_getAllAuthTokens_test",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>8600 createAccount err: " + JSON.stringify(err));
            accountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test", limitOwner,
              (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
                hilog.info(0x0000, tag, "====>8600 getAllAuthTokens err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>8600 getAllAuthTokens data: " + data);
                try {
                  if (err) {
                    expect(err?.code).assertEqual(12300002);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_callback_getAllAuthTokens_test",
                  (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>8600 removeAccount err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>8600 end====");
                    done();
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8700
     * @tc.name       ActsAccountAuthToken_8700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>8700 start====");
        hilog.info(0x0000, tag, "====>8700 createAccount start====");
        accountManager.createAccount("account_callback_getAllAuthTokens_test",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>8700 createAccount err: " + JSON.stringify(err));
            accountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test", "",
              (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
                hilog.info(0x0000, tag, "====>8700 getAllAuthTokens err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>8700 getAllAuthTokens data: " + data);
                try {
                  if (err) {
                    expect(err?.code).assertEqual(12300002);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_callback_getAllAuthTokens_test",
                  (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>8700 removeAccount err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>8700 end====");
                    done();
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8800
     * @tc.name       ActsAccountAuthToken_8800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>8800 start====");
        hilog.info(0x0000, tag, "====>8800 createAccount start====");
        accountManager.createAccount("account_callback_getAllAuthTokens_test",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>8800 createAccount err: " + JSON.stringify(err));
            accountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test", "invalid_owner",
              (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
                hilog.info(0x0000, tag, "====>8800 getAllAuthTokens err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>8800 getAllAuthTokens data: " + data);
                try {
                  if (err) {
                    expect(err?.code).assertEqual(12300003);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_callback_getAllAuthTokens_test",
                  (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>8800 removeAccount err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>8800 end====");
                    done();
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8801
     * @tc.name       ActsAccountAuthToken_8801
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>8801 start====");
        hilog.info(0x0000, tag, "====>8801 createAccount start====");
        accountManager.createAccount("account_callback_getAllAuthTokens_test",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>8801 createAccount err: " + JSON.stringify(err));
            accountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test", "invalid_owner").then((data) => {
                hilog.info(0x0000, tag, '====>promise run err');
                expect().assertFail();
              }).catch((e: Error) => {
                let err = e as BusinessError;
                hilog.info(0x0000, tag, "====>8801 getAllAuthTokens err: " + err);
                hilog.info(0x0000, tag, "====>8801 getAllAuthTokens err code: " + err.code);
                try {
                  if (err) {
                    expect(err.code).assertEqual(12300003);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_callback_getAllAuthTokens_test",
                  (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>8801 removeAccount err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>8801 end====");
                    done();
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_8900
     * @tc.name       ActsAccountAuthToken_8900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>8900 start====");
        hilog.info(0x0000, tag, "====>8900 createAccount start====");
        accountManager.createAccount("account_callback_getAllAuthTokens_test",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>8900 createAccount err: " + JSON.stringify(err));
            accountManager.getAllAuthTokens("account_callback_getAllAuthTokens_test", " ",
              (err: BusinessError<void> | null, data: Array<account.AuthTokenInfo> | undefined): void => {
                hilog.info(0x0000, tag, "====>8900 getAllAuthTokens err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>8900 getAllAuthTokens data: " + data);
                try {
                  if (err) {
                    expect(err?.code).assertEqual(12300003);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_callback_getAllAuthTokens_test",
                  (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>8900 removeAccount err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>8900 end====");
                    done();
                  });
              });
          });
      });

    /**
    * @tc.number     ActsAccountAuthToken_0100
    * @tc.name       ActsAccountAuthToken_0100
    * @tc.desc       test setAuthToken
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountAuthToken_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0100 start====");
        hilog.info(0x0000, tag, "====>0100 createAccount start====");
        accountManager.createAccount("account_callback_normal", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>0100 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_normal", "authType", "callback_normal_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>0100 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_normal", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>0100 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>0100 getAuthToken data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("callback_normal_token");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.checkAuthTokenVisibility("account_callback_normal", "authType", OWNERSELF,
                    (err: BusinessError<void> | null, data: boolean | undefined): void => {
                      hilog.info(0x0000, tag, "====>0100 checkAuthTokenVisibility err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>0100 checkAuthTokenVisibility data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual(true);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.deleteAuthToken("account_callback_normal", OWNERSELF, "authType",
                        "callback_normal_token", (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>0100 deleteAuthToken err: " + JSON.stringify(err));
                          try {
                            expect(err).assertEqual(null);
                          } catch (err) {
                            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                          }
                          accountManager.removeAccount("account_callback_normal",
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>0100 removeAccount err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>0100 end====");
                              done();
                            });
                        });
                    });
                });
            });
        });
      });

    /**
        * @tc.number     ActsAccountAuthToken_0200
        * @tc.name       ActsAccountAuthToken_0200
        * @tc.desc       test setAuthToken
        * @tc.type       FUNCTION
        * @tc.size       MEDIUMTEST
        * @tc.level      LEVEL0
        */
    it('ActsAccountAuthToken_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0200 start====");
        try {
          hilog.info(0x0000, tag, "====>0200 createAccount start====");
          await accountManager.createAccount("promise_normal");
          hilog.info(0x0000, tag, "====>0200 setAuthToken start====");
          await accountManager.setAuthToken("promise_normal", "authType", "promise_normal_token");
          hilog.info(0x0000, tag, "====>0200 getAuthToken start====");
          let data1: string = await accountManager.getAuthToken("promise_normal", OWNERSELF, "authType");
          hilog.info(0x0000, tag, "====>getAuthToken 0200 data: " + data1);
          expect(data1).assertEqual("promise_normal_token");
          hilog.info(0x0000, tag, "====>0200 checkAuthTokenVisibility start====");
          let state: boolean = await accountManager.checkAuthTokenVisibility("promise_normal", "authType", OWNERSELF);
          hilog.info(0x0000, tag, "====>checkAuthTokenVisibility ActsAccountAuthToken_0200 state: " + state);
          expect(state).assertEqual(true);
          hilog.info(0x0000, tag, "====>0200 deleteAuthToken start====");
          await accountManager.deleteAuthToken("promise_normal", OWNERSELF, "authType", "promise_normal_token");
          hilog.info(0x0000, tag, "====>0200 removeAccount start====");
          await accountManager.removeAccount("promise_normal");
          hilog.info(0x0000, tag, "====>0200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>7500 getAuthToken err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_0300
     * @tc.name       ActsAccountAuthToken_0300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0300 start====");
        hilog.info(0x0000, tag, "====>0300 getAuthToken start====");
        accountManager.createAccount("account_callback_noSetToken", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>0300 createAccount err: " + JSON.stringify(err));
          accountManager.getAuthToken("account_callback_noSetToken", OWNERSELF, "authType",
            (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>0300 getAuthToken err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>0300 getAuthToken data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300107);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_callback_noSetToken", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>0300 removeAccount err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>0300 end====");
                done();
              });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_0400
     * @tc.name       ActsAccountAuthToken_0400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0400 start====");
        hilog.info(0x0000, tag, "====>0400 createAccount start====");
        await accountManager.createAccount("promise_noSetToken");
        hilog.info(0x0000, tag, "====>0400 getAuthToken start====");
        try {
          await accountManager.getAuthToken("promise_noSetToken", OWNERSELF, "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>0400 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>0400 removeAccount start====");
          await accountManager.removeAccount("promise_noSetToken");
          hilog.info(0x0000, tag, "====>0400 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_0500
     * @tc.name       ActsAccountAuthToken_0500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0500 start====");
        hilog.info(0x0000, tag, "====>0500 getAuthToken start====");
        accountManager.getAuthToken("noAdd_account_callback", OWNERSELF, "authType",
          (err: BusinessError<void> | null, data: string | undefined): void => {
            hilog.info(0x0000, tag, "====>0500 getAuthToken err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>0500 getAuthToken data: " + data);
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_0600
     * @tc.name       ActsAccountAuthToken_0600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0600 start====");
        hilog.info(0x0000, tag, "====>0600 getAuthToken start====");
        try {
          await accountManager.getAuthToken("noAdd_account_promise", OWNERSELF, "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>0600 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>0600 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_0700
     * @tc.name       ActsAccountAuthToken_0700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0700 start====");
        hilog.info(0x0000, tag, "====>0700 createAccount start====");
        accountManager.createAccount("account_callback_setSameAuthType", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>0700 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_setSameAuthType", "authType", "callback_setSameAuthType_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>0700 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthToken("account_callback_setSameAuthType", "authType",
                "callback_setSameAuthType_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>0700 setAuthToken err: " + JSON.stringify(err));
                  accountManager.getAuthToken("account_callback_setSameAuthType", OWNERSELF, "authType",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>0700 getAuthToken err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>0700 getAuthToken data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("callback_setSameAuthType_token");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.setAuthToken("account_callback_setSameAuthType", "authType",
                        "callback_setSameAuthType_DiffToken", (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>0700 setAuthToken err: " + JSON.stringify(err));
                          accountManager.getAuthToken("account_callback_setSameAuthType", OWNERSELF, "authType",
                            (err: BusinessError<void> | null, data: string | undefined): void => {
                              hilog.info(0x0000, tag, "====>0700 getAuthToken err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>0700 getAuthToken data: " + data);
                              try {
                                if (err) {
                                  hilog.info(0x0000, tag, "====>run err");
                                  expect().assertFail();
                                } else {
                                  if (data) {
                                    expect(data).assertEqual("callback_setSameAuthType_DiffToken");
                                  } else {
                                    hilog.info(0x0000, tag, "====>run err");
                                    expect().assertFail();
                                  }
                                }
                              } catch (err) {
                                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                              }
                              accountManager.removeAccount("account_callback_setSameAuthType",
                                (err: BusinessError<void> | null): void => {
                                  hilog.info(0x0000, tag, "====>0700 removeAccount err: " + JSON.stringify(err));
                                  hilog.info(0x0000, tag, "====>0700 end====");
                                  done();
                                });
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_0800
     * @tc.name       ActsAccountAuthToken_0800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0800 start====");
        try {
          hilog.info(0x0000, tag, "====>0800 createAccount start====");
          await accountManager.createAccount("promise_setSameAuthType");
          hilog.info(0x0000, tag, "====>0800 setAuthToken start====");
          await accountManager.setAuthToken("promise_setSameAuthType", "authType",
            "promise_setSameAuthType_token");
          hilog.info(0x0000, tag, "====>0800 repeat setAuthToken start====");
          await accountManager.setAuthToken("promise_setSameAuthType", "authType",
            "promise_setSameAuthType_token");
          let data1: string = await accountManager.getAuthToken("promise_setSameAuthType", OWNERSELF, "authType");
          hilog.info(0x0000, tag, "====>getAuthToken 0800 data: " + data1);
          expect(data1).assertEqual("promise_setSameAuthType_token");
          hilog.info(0x0000, tag, "====>0800 repeat set diffToken setAuthToken start====");
          await accountManager.setAuthToken("promise_setSameAuthType", "authType",
            "promise_setSameAuthType_DiffToken");
          let data2: string = await accountManager.getAuthToken("promise_setSameAuthType", OWNERSELF, "authType");
          hilog.info(0x0000, tag, "====>getAuthToken 0800 data: " + data2);
          expect(data2).assertEqual("promise_setSameAuthType_DiffToken");
          hilog.info(0x0000, tag, "====>0800 removeAccount start====");
          await accountManager.removeAccount("promise_setSameAuthType");
          hilog.info(0x0000, tag, "====>0800 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_0800 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_0900
     * @tc.name       ActsAccountAuthToken_0900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>0900 start====");
        accountManager.createAccount("account_callback_setDiff", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_0900 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_setDiff", "authType1", "callback_setDiff_token1",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 0900 err: " + JSON.stringify(err));
              accountManager.setAuthToken("account_callback_setDiff", "authType2", "callback_setDiff_token2",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>getAuthToken 0900 err: " + JSON.stringify(err));
                  accountManager.getAuthToken("account_callback_setDiff", OWNERSELF, "authType1",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>getAuthToken 0900 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>getAuthToken 0900 data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("callback_setDiff_token1");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.getAuthToken("account_callback_setDiff", OWNERSELF, "authType2",
                        (err: BusinessError<void> | null, data: string | undefined): void => {
                          hilog.info(0x0000, tag, "====>getAuthToken 0900 err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>getAuthToken 0900 data: " + data);
                          try {
                            if (err) {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            } else {
                              if (data) {
                                expect(data).assertEqual("callback_setDiff_token2");
                              } else {
                                hilog.info(0x0000, tag, "====>run err");
                                expect().assertFail();
                              }
                            }
                          } catch (err) {
                            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                          }
                          accountManager.removeAccount("account_callback_setDiff",
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag,
                                "====>removeAccount ActsAccountAuthToken_0900 err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>0900 end====");
                              done();
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_1000
     * @tc.name       ActsAccountAuthToken_1000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1000 start====");
        try {
          hilog.info(0x0000, tag, "====>1000 createAccount start====");
          await accountManager.createAccount("promise_setDiff");
          hilog.info(0x0000, tag, "====>setAuthToken 1000 start====");
          await accountManager.setAuthToken("promise_setDiff", "aythType1", "promise_setDiff_token1");
          hilog.info(0x0000, tag, "====>setAuthToken 1000 start====");
          await accountManager.setAuthToken("promise_setDiff", "aythType2", "promise_setDiff_token2");
          hilog.info(0x0000, tag, "====>getAuthToken 1000 start====");
          let data1: string = await accountManager.getAuthToken("promise_setDiff", OWNERSELF, "aythType1");
          hilog.info(0x0000, tag, "====>getAuthToken getOld 1000 data: " + data1);
          expect(data1).assertEqual("promise_setDiff_token1");
          hilog.info(0x0000, tag, "====>getAuthToken 1000 start====");
          let data2: string = await accountManager.getAuthToken("promise_setDiff", OWNERSELF, "aythType2");
          hilog.info(0x0000, tag, "====>getAuthToken getNew 1000 data: " + data2);
          expect(data2).assertEqual("promise_setDiff_token2");
          hilog.info(0x0000, tag, "====>deleteAuthToken 1000 start====");
          await accountManager.deleteAuthToken("promise_setDiff", OWNERSELF, "aythType1", "promise_setDiff_token1");
          hilog.info(0x0000, tag, "====>deleteAuthToken 1000 start====");
          await accountManager.deleteAuthToken("promise_setDiff", OWNERSELF, "aythType2", "promise_setDiff_token2");
          hilog.info(0x0000, tag, "====>1000 removeAccount start====");
          await accountManager.removeAccount("promise_setDiff");
          hilog.info(0x0000, tag, "====>1000 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_1000 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_1100
     * @tc.name       ActsAccountAuthToken_1100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1100 start====");
        accountManager.createAccount("account_callback_setDeleteGet", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_1100 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_setDeleteGet", "old_authType", "callback_setDeleteGet_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 1100 err: " + JSON.stringify(err));
              accountManager.setAuthToken("account_callback_setDeleteGet", "new_authType",
                "callback_setDeleteGet_token",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>getAuthToken 1100 err: " + JSON.stringify(err));
                  accountManager.getAuthToken("account_callback_setDeleteGet", OWNERSELF, "old_authType",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>getAuthToken getOld 1100 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>getAuthToken getOld 1100 data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("callback_setDeleteGet_token");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.getAuthToken("account_callback_setDeleteGet", OWNERSELF, "new_authType",
                        (err: BusinessError<void> | null, data: string | undefined): void => {
                          hilog.info(0x0000, tag, "====>getAuthToken getNew 1100 err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>getAuthToken getNew 1100 data: " + data);
                          try {
                            if (err) {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            } else {
                              if (data) {
                                expect(data).assertEqual("callback_setDeleteGet_token");
                              } else {
                                hilog.info(0x0000, tag, "====>run err");
                                expect().assertFail();
                              }
                            }
                          } catch (err) {
                            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                          }
                          accountManager.deleteAuthToken("account_callback_setDeleteGet", OWNERSELF, "old_authType",
                            "callback_setDeleteGet_token", (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag,
                                "====>deleteAuthToken deleteOld 1100 err: " + JSON.stringify(err));
                              accountManager.getAuthToken("account_callback_setDeleteGet", OWNERSELF, "old_authType",
                                (err: BusinessError<void> | null, data: string | undefined): void => {
                                  hilog.info(0x0000, tag, "====>getAuthToken getOld 1100 err: " + JSON.stringify(err));
                                  hilog.info(0x0000, tag, "====>getAuthToken getOld 1100 data: " + data);
                                  try {
                                    if (err) {
                                      expect(err?.code).assertEqual(12300107);
                                    } else {
                                      hilog.info(0x0000, tag, "====>run err");
                                      expect().assertFail();
                                    }
                                  } catch (err) {
                                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                                  }
                                  accountManager.getAuthToken("account_callback_setDeleteGet", OWNERSELF,
                                    "new_authType",
                                    (err: BusinessError<void> | null, data: string | undefined): void => {
                                      hilog.info(0x0000, tag,
                                        "====>getAuthToken getNew 1100 err: " + JSON.stringify(err));
                                      hilog.info(0x0000, tag, "====>getAuthToken getNew 1100 data: " + data);
                                      try {
                                        if (err) {
                                          hilog.info(0x0000, tag, "====>run err");
                                          expect().assertFail();
                                        } else {
                                          if (data) {
                                            expect(data).assertEqual("callback_setDeleteGet_token");
                                          } else {
                                            hilog.info(0x0000, tag, "====>run err");
                                            expect().assertFail();
                                          }
                                        }
                                      } catch (err) {
                                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                                      }
                                      accountManager.deleteAuthToken("account_callback_setDeleteGet", OWNERSELF,
                                        "new_authType", "callback_setDeleteGet_token",
                                        (err: BusinessError<void> | null): void => {
                                          hilog.info(0x0000, tag,
                                            "====>deleteToken New 1100 err: " + JSON.stringify(err));
                                          accountManager.getAuthToken("account_callback_setDeleteGet", OWNERSELF,
                                            "old_authType",
                                            (err: BusinessError<void> | null, data: string | undefined): void => {
                                              hilog.info(0x0000, tag, "====>getOld 1100 err: " + JSON.stringify(err));
                                              hilog.info(0x0000, tag, "====>getOld 1100 data: " + data);
                                              try {
                                                if (err) {
                                                  expect(err?.code).assertEqual(12300107);
                                                } else {
                                                  hilog.info(0x0000, tag, "====>run err");
                                                  expect().assertFail();
                                                }
                                              } catch (err) {
                                                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                                              }
                                              accountManager.getAuthToken("account_callback_setDeleteGet", OWNERSELF,
                                                "new_authType",
                                                (err: BusinessError<void> | null, data: string | undefined): void => {
                                                  hilog.info(0x0000, tag,
                                                    "====>getNew 1100 err: " + JSON.stringify(err));
                                                  hilog.info(0x0000, tag, "====>getNew 1100 data: " + data);
                                                  try {
                                                    if (err) {
                                                      expect(err?.code).assertEqual(12300107);
                                                    } else {
                                                      hilog.info(0x0000, tag, "====>run err");
                                                      expect().assertFail();
                                                    }
                                                  } catch (err) {
                                                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                                                  }
                                                  accountManager.removeAccount("account_callback_setDeleteGet",
                                                    (err: BusinessError<void> | null): void => {
                                                      hilog.info(0x0000, tag,
                                                        "====>remove 1100 err: " + JSON.stringify(err));
                                                      try {
                                                        expect(err).assertEqual(null);
                                                      } catch (err) {
                                                        hilog.info(0x0000, tag,
                                                          "====>Assert Fail: " + JSON.stringify(err));
                                                      }
                                                      hilog.info(0x0000, tag, "====>1100 end====");
                                                      done();
                                                    });
                                                });
                                            })
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_1200
     * @tc.name       ActsAccountAuthToken_1200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1200 start====");
        hilog.info(0x0000, tag, "====>1200 createAccount start====");
        await accountManager.createAccount("promise_setDeleteGet");
        hilog.info(0x0000, tag, "====>setAuthToken setOld 1200 start====");
        await accountManager.setAuthToken("promise_setDeleteGet", "old_authType", "promise_setDeleteGet_token");
        hilog.info(0x0000, tag, "====>setAuthToken setNew 1200 start====");
        await accountManager.setAuthToken("promise_setDeleteGet", "new_authType", "promise_setDeleteGet_token");
        hilog.info(0x0000, tag, "====>getAuthToken 1200 start====");
        let data1BeforeDel: string =
          await accountManager.getAuthToken("promise_setDeleteGet", OWNERSELF, "old_authType");
        hilog.info(0x0000, tag, "====>getAuthToken getOld 1200 data1BeforeDel: " + data1BeforeDel);
        expect(data1BeforeDel).assertEqual("promise_setDeleteGet_token");
        hilog.info(0x0000, tag, "====>getAuthToken 1200 start====");
        let data2BeforeDel: string =
          await accountManager.getAuthToken("promise_setDeleteGet", OWNERSELF, "new_authType");
        hilog.info(0x0000, tag, "====>getAuthToken getNew 1200 data2BeforeDel: " + data2BeforeDel);
        expect(data2BeforeDel).assertEqual("promise_setDeleteGet_token");
        hilog.info(0x0000, tag, "====>deleteAuthToken deleteOld 1200 start====");
        try {
          await accountManager.deleteAuthToken("promise_setDeleteGet", OWNERSELF, "old_authType",
            "promise_setDeleteGet_token");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>deleteAuthToken 1200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>getAuthToken 1200 start====");
        try {
          let data1AfterDel: string =
            await accountManager.getAuthToken("promise_setDeleteGet", OWNERSELF, "old_authType",);
          hilog.info(0x0000, tag, "====>getAuthToken getOld 1200 data1_AfterDel: " + data1AfterDel);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken getOld 1200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
        }
        hilog.info(0x0000, tag, "====>getAuthToken 1200 start====");
        try {
          let data2AfterDel: string =
            await accountManager.getAuthToken("promise_setDeleteGet", OWNERSELF, "new_authType",);
          hilog.info(0x0000, tag, "====>getAuthToken getOld 1200 data2_AfterDel: " + data2AfterDel);
          expect(data2AfterDel).assertEqual("promise_setDeleteGet_token");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken getNew 1200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>deleteAuthToken deleteNew 1200 start====");
        try {
          await accountManager.deleteAuthToken("promise_setDeleteGet", OWNERSELF, "new_authType",
            "promise_setDeleteGet_token");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>deleteAuthToken 1200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>getAuthToken getOld 1200 start====");
        try {
          let data1AgainDel: string =
            await accountManager.getAuthToken("promise_setDeleteGet", OWNERSELF, "old_authType",);
          hilog.info(0x0000, tag, "====>getAuthToken getOld 1200 data1_AgainDel: " + data1AgainDel);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken getOld 1200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
        }
        hilog.info(0x0000, tag, "====>getAuthToken getNew 1200 start====");
        try {
          let data2AgainDel: string =
            await accountManager.getAuthToken("promise_setDeleteGet", OWNERSELF, "new_authType",);
          hilog.info(0x0000, tag, "====>getAuthToken getOld 1200 data2_AgainDel: " + data2AgainDel);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken getNew 1200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
        }
        await accountManager.removeAccount("promise_setDeleteGet");
        hilog.info(0x0000, tag, "====>1200 end====");
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_1300
     * @tc.name       ActsAccountAuthToken_1300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1300 start====");
        accountManager.createAccount("account_callback_setDeleteGet", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_1300 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_setDeleteGet", "authType",
            "account_callback_setDeleteGet_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 1300 err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_setDeleteGet", OWNERSELF, "authType",
                "account_callback_setDeleteGet_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>deleteAuthToken 1300 err: " + JSON.stringify(err));
                  accountManager.getAuthToken("account_callback_setDeleteGet", OWNERSELF, "authType",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>getAuthToken 1300 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>getAuthToken 1300 data: " + data);
                      try {
                        if (err) {
                          expect(err?.code).assertEqual(12300107);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      } catch (err) {
                        hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_callback_setDeleteGet",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag,
                            "====>removeAccount ActsAccountAuthToken_1300 err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>1300 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_1400
     * @tc.name       ActsAccountAuthToken_1400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1400 start====");
        hilog.info(0x0000, tag, "====>1400 createAccount start====");
        await accountManager.createAccount("promise_setDeleteGet");
        hilog.info(0x0000, tag, "====>setAuthToken 1400 start====");
        await accountManager.setAuthToken("promise_setDeleteGet", "authType", "promise_setDeleteGet_token");
        hilog.info(0x0000, tag, "====>deleteAuthToken 1400 start====");
        await accountManager.deleteAuthToken("promise_setDeleteGet", OWNERSELF, "authType",
          "promise_setDeleteGet_token");
        hilog.info(0x0000, tag, "====>getAuthToken 1400 start====");
        try {
          await accountManager.getAuthToken("promise_setDeleteGet", OWNERSELF, "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken 1400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>1400 removeAccount start====");
          await accountManager.removeAccount("promise_setDeleteGet");
          hilog.info(0x0000, tag, "====>1400 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_1500
     * @tc.name       ActsAccountAuthToken_1500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1500 start====");
        accountManager.setAuthToken("account_callback_accountNotExit", "authType",
          "account_callback_accountNotExit_token", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setAuthToken 1500 err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
                hilog.info(0x0000, tag, "====>ActsAccountAuthToken_1500 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_1600
     * @tc.name       ActsAccountAuthToken_1600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1600 start====");
        hilog.info(0x0000, tag, "====>setAuthToken 1600 start====");
        try {
          await accountManager.setAuthToken("promise_accountNotExit", "authType",
            "promise_accountNotExit_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setAuthToken 1600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>1600 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_1700
     * @tc.name       ActsAccountAuthToken_1700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1700 start====");
        accountManager.deleteAuthToken("account_callback_accountNotExit", OWNERSELF, "authType",
          "account_callback_accountNotExit_token", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>deleteAuthToken 1700 err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
                hilog.info(0x0000, tag, "====>1700 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_1800
     * @tc.name       ActsAccountAuthToken_1800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1800 start====");
        hilog.info(0x0000, tag, "====>deleteAuthToken 1800 start====");
        try {
          await accountManager.deleteAuthToken("promise_accountNotExit", OWNERSELF, "authType",
            "promise_accountNotExit_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>deleteAuthToken 1800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>1800 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_1900
     * @tc.name       ActsAccountAuthToken_1900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>1900 start====");
        accountManager.createAccount("account_callback_repeatDelete", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount 1900 err: " + JSON.stringify(err));
          accountManager.deleteAuthToken("account_callback_repeatDelete", OWNERSELF, "aythType",
            "promise_repeatDelete_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>deleteAuthToken 1900 err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_repeatDelete", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>getAuthToken 1900 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>getAuthToken 1900 data: " + data);
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300107);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_repeatDelete",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag,
                        "====>removeAccount ActsAccountAuthToken_1900 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>1900 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_2000
     * @tc.name       ActsAccountAuthToken_2000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>2000 start====");
        hilog.info(0x0000, tag, "====>2000 createAccount start====");
        await accountManager.createAccount("promise_noExitToken");
        hilog.info(0x0000, tag, "====>deleteAuthToken 2000 start====");
        try {
          await accountManager.deleteAuthToken("promise_noExitToken", OWNERSELF, "aythType", "test_token")
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>deleteAuthToken 2000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
        }
        ;
        try {
          hilog.info(0x0000, tag, "====>getAuthToken 2000 start====");
          await accountManager.getAuthToken("promise_noExitToken", OWNERSELF, "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken 2000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>2000 removeAccount start====");
          await accountManager.removeAccount("promise_noExitToken");
          hilog.info(0x0000, tag, "====>2000 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_2100
     * @tc.name       ActsAccountAuthToken_2100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>2100 start====");
        accountManager.createAccount("account_callback_repeatDelete", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_2100 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_repeatDelete", "authType", "",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 2100 err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_repeatDelete", OWNERSELF, "aythType",
                "promise_repeatDelete_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>deleteAuthToken first ActsAccountAuthToken_2100 err: " + JSON.stringify(err));
                  accountManager.getAuthToken("account_callback_repeatDelete", OWNERSELF, "authType",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag,
                        "====>getAuthToken first ActsAccountAuthToken_2100 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>getAuthToken first ActsAccountAuthToken_2100 data: " + data);
                      try {
                        if (err) {
                          expect(err?.code).assertEqual(12300107);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      } catch (err) {
                        hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                      }
                      accountManager.deleteAuthToken("account_callback_repeatDelete", OWNERSELF, "aythType",
                        "promise_repeatDelete_token", (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>deleteAuthToken second 2100 err: " + JSON.stringify(err));
                          accountManager.getAuthToken("account_callback_repeatDelete", OWNERSELF, "authType",
                            (err: BusinessError<void> | null, data: string | undefined): void => {
                              hilog.info(0x0000, tag, "====>getAuthToken second 2100 err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>getAuthToken second 2100 data: " + data);
                              try {
                                if (err) {
                                  expect(err?.code).assertEqual(12300107);
                                } else {
                                  hilog.info(0x0000, tag, "====>run err");
                                  expect().assertFail();
                                }
                              } catch (err) {
                                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                              }
                              accountManager.removeAccount("account_callback_repeatDelete",
                                (err: BusinessError<void> | null): void => {
                                  hilog.info(0x0000, tag,
                                    "====>removeAccount ActsAccountAuthToken_2100 err: " + JSON.stringify(err));
                                  hilog.info(0x0000, tag, "====>2100 end====");
                                  done();
                                });
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_2200
     * @tc.name       ActsAccountAuthToken_2200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>2200 start====");
        hilog.info(0x0000, tag, "====>2200 createAccount start====");
        await accountManager.createAccount("promise_repeatDelete");
        hilog.info(0x0000, tag, "====>setAuthToken 2200 start====");
        await accountManager.setAuthToken("promise_repeatDelete", "aythType", "promise_repeatDelete_token");
        hilog.info(0x0000, tag, "====>deleteAuthToken first ActsAccountAuthToken_2200 start====");
        await accountManager.deleteAuthToken("promise_repeatDelete", OWNERSELF, "aythType",
          "promise_repeatDelete_token");
        try {
          hilog.info(0x0000, tag, "====>deleteAuthToken second 2200 start====");
          await accountManager.deleteAuthToken("promise_repeatDelete", OWNERSELF, "aythType",
            "promise_repeatDelete_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>deleteAuthToken second 2200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
        }
        try {
          hilog.info(0x0000, tag, "====>getAuthToken 2200 start====");
          await accountManager.getAuthToken("promise_repeatDelete", OWNERSELF, "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken 2200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>2200 removeAccount start====");
          await accountManager.removeAccount("promise_repeatDelete");
          hilog.info(0x0000, tag, "====>2200 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_2300
     * @tc.name       ActsAccountAuthToken_2300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>2300 start====");
        accountManager.createAccount("account_callback_setEmptyToken", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_2300 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_setEmptyToken", "authType", "",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setAuthToken 2300 err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_setEmptyToken", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>getAuthToken 2300 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>getAuthToken 2300 data: " + data);
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300107);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_setEmptyToken",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag,
                        "====>removeAccount ActsAccountAuthToken_2300 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>2300 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_2400
     * @tc.name       ActsAccountAuthToken_2400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>2400 start====");
        hilog.info(0x0000, tag, "====>2400 createAccount start====");
        await accountManager.createAccount("promise_setEmptyToken");
        hilog.info(0x0000, tag, "====>setAuthToken 2400 start====");
        await accountManager.setAuthToken("promise_setEmptyToken", "aythType", "");
        hilog.info(0x0000, tag, "====>getAuthToken 2400 start====");
        try {
          await accountManager.getAuthToken("promise_setEmptyToken", "authType", "");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken 2400 err: " + JSON.stringify(err));
          // expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>2400 removeAccount start====");
          await accountManager.removeAccount("promise_setEmptyToken");
          hilog.info(0x0000, tag, "====>2400 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_2500
     * @tc.name       ActsAccountAuthToken_2500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>2500 start====");
        accountManager.createAccount("account_callback_spaceToken", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_2500 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_spaceToken", "authType", " ",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 2500 err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_spaceToken", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>getAuthToken 2500 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>getAuthToken 2500 data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual(" ");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_spaceToken",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag,
                        "====>removeAccount ActsAccountAuthToken_2500 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>2500 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_2600
     * @tc.name       ActsAccountAuthToken_2600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>2600 start====");
        try {
          hilog.info(0x0000, tag, "====>2600 createAccount start====");
          await accountManager.createAccount("promise_spaceToken");
          hilog.info(0x0000, tag, "====>setAuthToken 2600 start====");
          await accountManager.setAuthToken("promise_spaceToken", "aythType", " ");
          hilog.info(0x0000, tag, "====>getAuthToken 2600 start====");
          let data: string = await accountManager.getAuthToken("promise_spaceToken", OWNERSELF, "aythType");
          expect(data).assertEqual(" ");
          hilog.info(0x0000, tag, "====>2600 removeAccount start====");
          await accountManager.removeAccount("promise_spaceToken");
          hilog.info(0x0000, tag, "====>2600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_2600 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_2700
     * @tc.name       ActsAccountAuthToken_2700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let limitToken: string = '';
        for (let i: int = 0; i < TOKENLENGTHLIMIT + 1; i++) {
          limitToken += 't';
        }
        hilog.info(0x0000, tag, "====>2700 start====");
        accountManager.createAccount("account_callback_exceed_limitToken", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_2700 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_exceed_limitToken", "authType", limitToken,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 2700 err: " + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_callback_exceed_limitToken",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>removeAccount ActsAccountAuthToken_2700 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>2700 end====");
                  done();
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_2800
     * @tc.name       ActsAccountAuthToken_2800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitToken: string = '';
        for (let i: int = 0; i < TOKENLENGTHLIMIT + 1; i++) {
          limitToken += 't';
        }
        hilog.info(0x0000, tag, "====>2800 start====");
        hilog.info(0x0000, tag, "====>2800 createAccount start====");
        await accountManager.createAccount("promise_exceed_limitToken");
        hilog.info(0x0000, tag, "====>setAuthToken 2800 start====");
        try {
          await accountManager.setAuthToken("promise_exceed_limitToken", "authType", limitToken);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setAuthToken 2800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>2800 removeAccount start====");
          accountManager.removeAccount("promise_exceed_limitToken");
          hilog.info(0x0000, tag, "====>2800 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_2900
     * @tc.name       ActsAccountAuthToken_2900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitToken: string = '';
        for (let i: int = 0; i < TOKENLENGTHLIMIT; i++) {
          limitToken += 't';
        }
        hilog.info(0x0000, tag, "====>2900 start====");
        accountManager.createAccount("account_callback_limitToken", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_2900 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_limitToken", "authType", limitToken,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 2900 err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_limitToken", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>getAuthToken 2900 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>getAuthToken 2900 data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual(limitToken);
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_limitToken",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag,
                        "====>removeAccount ActsAccountAuthToken_2900 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>2900 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_3000
     * @tc.name       ActsAccountAuthToken_3000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let limitToken: string = '';
        for (let i: int = 0; i < TOKENLENGTHLIMIT; i++) {
          limitToken += 't';
        }
        hilog.info(0x0000, tag, "====>3000 start====");
        try {
          hilog.info(0x0000, tag, "====>3000 createAccount start====");
          await accountManager.createAccount("promise_limitToken");
          hilog.info(0x0000, tag, "====>setAuthToken 3000 start====");
          await accountManager.setAuthToken("promise_limitToken", "authType", limitToken);
          hilog.info(0x0000, tag, "====>getAuthToken 3000 start====");
          let data: string = await accountManager.getAuthToken("promise_limitToken", OWNERSELF, "authType");
          expect(data).assertEqual(limitToken);
          hilog.info(0x0000, tag, "====>3000 removeAccount start====");
          await accountManager.removeAccount("promise_limitToken");
          hilog.info(0x0000, tag, "====>3000 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_3000 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_3100
     * @tc.name       ActsAccountAuthToken_3100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 't';
        }
        hilog.info(0x0000, tag, "====>3100 start====");
        accountManager.createAccount("account_callback_limitAuthType", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_3100 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_limitAuthType", limitAuthType,
            "account_callback_limitAuthType_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 3100 err: " + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_callback_limitAuthType",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>removeAccount ActsAccountAuthToken_3100 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>3100 end====");
                  done();
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_3200
     * @tc.name       ActsAccountAuthToken_3200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 't';
        }
        hilog.info(0x0000, tag, "====>3200 start====");
        hilog.info(0x0000, tag, "====>3200 createAccount start====");
        await accountManager.createAccount("promise_exceed_limitAuthType");
        hilog.info(0x0000, tag, "====>setAuthToken 3200 start====");
        try {
          await accountManager.setAuthToken("promise_exceed_limitAuthType", limitAuthType,
            "promise_limitAuthType_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setAuthToken 3200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>3200 removeAccount start====");
          accountManager.removeAccount("promise_exceed_limitAuthType");
          hilog.info(0x0000, tag, "====>3200 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_3300
     * @tc.name       ActsAccountAuthToken_3300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 't';
        }
        hilog.info(0x0000, tag, "====>3300 start====");
        accountManager.createAccount("account_callback_limitAuthType", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountAuthToken_3300 err: " + JSON.stringify(err));
          accountManager.getAuthToken("account_callback_limitAuthType", "com.example.actsaccounttest", limitAuthType,
            (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 3300 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getAuthToken 3300 data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_callback_limitAuthType",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>removeAccount ActsAccountAuthToken_3300 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>3300 end====");
                  done();
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_3400
     * @tc.name       ActsAccountAuthToken_3400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 't';
        }
        hilog.info(0x0000, tag, "====>3400 start====");
        hilog.info(0x0000, tag, "====>3400 createAccount start====");
        await accountManager.createAccount("promise_limitAuthType");
        hilog.info(0x0000, tag, "====>getAuthToken 3400 start====");
        try {
          await accountManager.getAuthToken("promise_limitAuthType", OWNERSELF, limitAuthType);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAuthToken 3400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>3400 removeAccount start====");
          accountManager.removeAccount("promise_limitAuthType");
          hilog.info(0x0000, tag, "====>3400 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_3500
     * @tc.name       ActsAccountAuthToken_3500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 4
     */
    it('ActsAccountAuthToken_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>3500 start====");
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT; i++) {
          limitAuthType += 't';
        }
        hilog.info(0x0000, tag, "====>3500 create finish====");
        accountManager.createAccount("account_callback_limitAuthType", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountAuthToken_3500 err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_limitAuthType", limitAuthType,
            "account_callback_limitAuthType_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setAuthToken 3500 err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_limitAuthType", "com.example.actsaccountoperatetest.static",
                limitAuthType, (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>getAuthToken 3500 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>getAuthToken 3500 data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("account_callback_limitAuthType_token");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_limitAuthType",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag,
                        "====>delete Account ActsAccountAuthToken_3500 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>3500 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_4100
     * @tc.name       ActsAccountAuthToken_4100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4100 start====");
        hilog.info(0x0000, tag, "====>4100 create finish====");
        accountManager.deleteAuthToken(" ", "com.example.actsaccounttest", "authType", "account_notExist_token",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>clearauthToken 4100 err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>4100 end====");
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_4200
     * @tc.name       ActsAccountAuthToken_4200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4200 start====");
        hilog.info(0x0000, tag, "====>clear authToken 4200 start====");
        try {
          await accountManager.deleteAuthToken("", "com.example.actsaccounttest", "authType", "account_notExist_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>deleteAuthToken 4200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>4200 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_4300
     * @tc.name       ActsAccountAuthToken_4300
     * @tc.desc       The clear token parameter name is a space string
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
    */
    it('ActsAccountAuthToken_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4300 start====");
        hilog.info(0x0000, tag, "====>4300 create finish====");
        accountManager.deleteAuthToken(" ", "com.example.actsaccounttest", "authType", "account_notExist_token",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>clearauthToken 4300 err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>4300 end====");
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_4400
     * @tc.name       ActsAccountAuthToken_4400
     * @tc.desc       The clear token parameter name is a space string
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4400 start====");
        hilog.info(0x0000, tag, "====>clearauthToken 4400 start====");
        try {
          await accountManager.deleteAuthToken(" ", "com.example.actsaccounttest", "authType",
            "account_notExist_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>deleteAuthToken 4400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>4400 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_4500
     * @tc.name       ActsAccountAuthToken_4500
     * @tc.desc       Clear the token parameter name exceeds the length limit of 1024 characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4500 start====");
        let nameLimit: string = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          nameLimit += 't';
        }
        hilog.info(0x0000, tag, "====>4500 create finish====");
        accountManager.deleteAuthToken(nameLimit, "com.example.actsaccounttest", "authType", "account_notExist_token",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>clearauthToken 4500 err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>4500 end====");
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_4600
     * @tc.name       ActsAccountAuthToken_4600
     * @tc.desc       Clear the token parameter name exceeds the length limit of 1024 characters
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('ActsAccountAuthToken_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4600 start====");
        let nameLimit: string = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          nameLimit += 't';
        }
        hilog.info(0x0000, tag, "====>4600 create finish====");
        hilog.info(0x0000, tag, "====>deleteAuthToken 4600 start====");
        try {
          await accountManager.deleteAuthToken(nameLimit, "com.example.actsaccounttest", "authType",
            "account_notExist_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>deleteAuthToken 4600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>4600 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_4700
     * @tc.name       ActsAccountAuthToken_4700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4700 start====");
        hilog.info(0x0000, tag, "====>4700 create finish====");
        accountManager.createAccount("account_callback_invalid_owner", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountAuthToken_4700 err: " + JSON.stringify(err));
          accountManager.getAuthToken("account_callback_invalid_owner", "invalid_owner", "authType",
            (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>getAuthToken 4700 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getAuthToken 4700 data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300003);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_callback_invalid_owner",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete account ActsAccountAuthToken_4700 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>4700 end====");
                  done();
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_3600
     * @tc.name       ActsAccountAuthToken_3600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 4
     */
    it('ActsAccountAuthToken_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>3600 start====");
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT; i++) {
          limitAuthType += 't';
        }
        try {
          hilog.info(0x0000, tag, "====>3600 createAccount start====");
          await accountManager.createAccount("promise_limitAuthType");
          hilog.info(0x0000, tag, "====>3600 setAuthToken start====");
          await accountManager.setAuthToken("promise_limitAuthType", limitAuthType,
            "promise_limitAuthType_token");
          hilog.info(0x0000, tag, "====>3600 getAuthToken start====");
          let data: string = await accountManager.getAuthToken("promise_limitAuthType", OWNERSELF, limitAuthType);
          expect(data).assertEqual("promise_limitAuthType_token");
          hilog.info(0x0000, tag, "====>3600 removeAccount start====");
          await accountManager.removeAccount("promise_limitAuthType");
          hilog.info(0x0000, tag, "====>3600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_3600 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_3700
     * @tc.name       ActsAccountAuthToken_3700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>3700 start====");
        accountManager.createAccount("account_callback_authType_empty", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>3700 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_authType_empty", "", "account_callback_authType_empty_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>3700 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_authType_empty", OWNERSELF, "",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>3700 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>3700 getAuthToken data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("account_callback_authType_empty_token");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_authType_empty",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>3700 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>3700 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_3800
     * @tc.name       ActsAccountAuthToken_3800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>3800 start====");
        try {
          hilog.info(0x0000, tag, "====>3800 createAccount start====");
          await accountManager.createAccount("promise_authType_empty");
          hilog.info(0x0000, tag, "====>3800 setAuthToken start====");
          await accountManager.setAuthToken("promise_authType_empty", "", "promise_authType_empty_token");
          hilog.info(0x0000, tag, "====>3800 getAuthToken start====");
          let data: string = await accountManager.getAuthToken("promise_authType_empty", OWNERSELF, "");
          expect(data).assertEqual("promise_authType_empty_token");
          hilog.info(0x0000, tag, "====>3800 removeAccount start====");
          await accountManager.removeAccount("promise_authType_empty");
          hilog.info(0x0000, tag, "====>3800 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_3800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_3900
     * @tc.name       ActsAccountAuthToken_3900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>3900 start====");
        hilog.info(0x0000, tag, "====>3900 createAccount start====");
        accountManager.createAccount("account_callback_authType_space", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>3900 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_authType_space", " ", "account_callback_authType_space_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>3900 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_authType_space", OWNERSELF, " ",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>3900 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>3900 getAuthToken data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("account_callback_authType_space_token");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_authType_space",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>3900 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>3900 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_4000
     * @tc.name       ActsAccountAuthToken_4000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4000 start====");
        try {
          hilog.info(0x0000, tag, "====>4000 createAccount start====");
          await accountManager.createAccount("promise_authType_space");
          hilog.info(0x0000, tag, "====>4000 setAuthToken start====");
          await accountManager.setAuthToken("promise_authType_space", " ",
            "promise_authType_space_token");
          hilog.info(0x0000, tag, "====>4000 getAuthToken start====");
          let data: string = await accountManager.getAuthToken("promise_authType_space", OWNERSELF, " ");
          expect(data).assertEqual("promise_authType_space_token");
          hilog.info(0x0000, tag, "====>4000 removeAccount start====");
          await accountManager.removeAccount("promise_authType_space");
          hilog.info(0x0000, tag, "====>4000 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>checkDataSyncEnabled 1200 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_4800
     * @tc.name       ActsAccountAuthToken_4800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4800 start====");
        hilog.info(0x0000, tag, "====>4800 createAccount start====");
        await accountManager.createAccount("promise_invalid_owner");
        hilog.info(0x0000, tag, "====>4800 getAuthToken start====");
        try {
          await accountManager.getAuthToken("promise_invalid_owner", "invalid_owner", "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>4800 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>4800 removeAccount start====");
          await accountManager.removeAccount("promise_invalid_owner");
          hilog.info(0x0000, tag, "====>4800 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_4900
     * @tc.name       ActsAccountAuthToken_4900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>4900 start====");
        hilog.info(0x0000, tag, "====>4900 createAccount start====");
        accountManager.createAccount("account_callback_owner_empty", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>4900 createAccount err: " + JSON.stringify(err));
          accountManager.getAuthToken("account_callback_owner_empty", "", "authType",
            (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>4900 getAuthToken err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>4900 getAuthToken data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_callback_owner_empty", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>4900 removeAccount err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>4900 end====");
                done();
              });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_5000
     * @tc.name       ActsAccountAuthToken_5000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5000 start====");
        hilog.info(0x0000, tag, "====>5000 createAccount start====");
        await accountManager.createAccount("promise_owner_empty");
        hilog.info(0x0000, tag, "====>5000 getAuthToken start====");
        try {
          await accountManager.getAuthToken("promise_owner_empty", "", "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>5000 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>5000 removeAccount start====");
          await accountManager.removeAccount("promise_owner_empty");
          hilog.info(0x0000, tag, "====>5000 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_5100
     * @tc.name       ActsAccountAuthToken_5100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5100 start====");
        hilog.info(0x0000, tag, "====>5100 createAccount start====");
        accountManager.createAccount("account_callback_owner_space", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>5100 createAccount err: " + JSON.stringify(err));
          accountManager.getAuthToken("account_callback_owner_space", " ", "authType",
            (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>5100 getAuthToken err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>5100 getAuthToken data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300003);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_callback_owner_space", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>5100 removeAccount err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>5100 end====");
                done();
              });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_5200
     * @tc.name       ActsAccountAuthToken_5200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5200 start====");
        hilog.info(0x0000, tag, "====>5200 createAccount start====");
        await accountManager.createAccount("account_callback_owner_space");
        hilog.info(0x0000, tag, "====>5200 getAuthToken start====");
        try {
          await accountManager.getAuthToken("account_callback_owner_space", " ", "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>5200 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>5200 removeAccount start====");
          await accountManager.removeAccount("account_callback_owner_space");
          hilog.info(0x0000, tag, "====>5200 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_5300
     * @tc.name       ActsAccountAuthToken_5300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5300 start====");
        hilog.info(0x0000, tag, "====>5300 createAccount start====");
        accountManager.createAccount("account_callback_authType_invalid", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>5300 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_authType_invalid", "authType",
            "account_callback_authType_invalid_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>5300 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_authType_invalid", OWNERSELF, "invalid_authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>5300 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>5300 getAuthToken data: " + data);
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300107);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_authType_invalid",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>5300 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>5300 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_5400
     * @tc.name       ActsAccountAuthToken_5400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5400 start====");
        hilog.info(0x0000, tag, "====>5400 createAccount start====");
        await accountManager.createAccount("promise_authType_invalid");
        hilog.info(0x0000, tag, "====>5400 setAuthToken start====");
        await accountManager.setAuthToken("promise_authType_invalid", "authType",
          "promise_authType_invalid_token");
        hilog.info(0x0000, tag, "====>5400 getAuthToken start====");
        try {
          await accountManager.getAuthToken("promise_authType_invalid", OWNERSELF, "invalid_authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>5400 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>5400 removeAccount start====");
          await accountManager.removeAccount("promise_authType_invalid");
          hilog.info(0x0000, tag, "====>5400 end====");
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_5500
     * @tc.name       ActsAccountAuthToken_5500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5500 start====");
        hilog.info(0x0000, tag, "====>5500 createAccount start====");
        accountManager.createAccount("account_callback_authType_empty", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>5500 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_authType_empty", "authType",
            "account_callback_authType_empty_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>5500 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_authType_empty", OWNERSELF, "",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>5500 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>5500 getAuthToken data: " + data);
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300107);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_authType_empty",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>5500 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>5500 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_5600
     * @tc.name       ActsAccountAuthToken_5600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5600 start====");
        hilog.info(0x0000, tag, "====>5600 createAccount start====");
        await accountManager.createAccount("promise_authType_empty");
        hilog.info(0x0000, tag, "====>5600 setAuthToken start====");
        await accountManager.setAuthToken("promise_authType_empty", "authType",
          "promise_authType_empty_token");
        hilog.info(0x0000, tag, "====>5600 getAuthToken start====");
        try {
          await accountManager.getAuthToken("promise_authType_empty", OWNERSELF, "");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>5600 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>5600 removeAccount start====");
          await accountManager.removeAccount("promise_authType_empty");
          hilog.info(0x0000, tag, "====>5600 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_5700
     * @tc.name       ActsAccountAuthToken_5700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5700 start====");
        hilog.info(0x0000, tag, "====>5700 createAccount start====");
        accountManager.createAccount("account_callback_authType_space", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>5700 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_authType_space", "authType",
            "account_callback_authType_space_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>5700 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_callback_authType_space", OWNERSELF, " ",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>5700 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>5700 getAuthToken data: " + data);
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300107);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_authType_space",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>5700 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>5700 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_5800
     * @tc.name       ActsAccountAuthToken_5800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5800 start====");
        hilog.info(0x0000, tag, "====>5800 createAccount start====");
        await accountManager.createAccount("promise_authType_space");
        hilog.info(0x0000, tag, "====>5800 setAuthToken start====");
        await accountManager.setAuthToken("promise_authType_space", "authType",
          "promise_authType_space_token");
        hilog.info(0x0000, tag, "====>5800 getAuthToken start====");
        try {
          await accountManager.getAuthToken("promise_authType_space", OWNERSELF, " ");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>5800 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          hilog.info(0x0000, tag, "====>5800 removeAccount start====");
          await accountManager.removeAccount("promise_authType_space");
          hilog.info(0x0000, tag, "====>5800 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_5900
     * @tc.name       ActsAccountAuthToken_5900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>5900 start====");
        hilog.info(0x0000, tag, "====>5900 createAccount start====");
        accountManager.createAccount("account_callback_owner_invalid", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>5900 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_owner_invalid", "authType",
            "account_callback_owner_invalid_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>5900 setAuthToken err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_owner_invalid", "invalid_owner", "authType",
                "account_callback_owner_invalid_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>5900 getAuthToken err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300003);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_owner_invalid",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>5900 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>5900 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_6000
     * @tc.name       ActsAccountAuthToken_6000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>6000 start====");
        hilog.info(0x0000, tag, "====>6000 createAccount start====");
        await accountManager.createAccount("promise_owner_invalid");
        hilog.info(0x0000, tag, "====>6000 setAuthToken start====");
        await accountManager.setAuthToken("promise_owner_invalid", "authType",
          "promise_owner_invalid_token");
        hilog.info(0x0000, tag, "====>6000 getAuthToken start====");
        try {
          await accountManager.deleteAuthToken("promise_owner_invalid", "invalid_owner", "authType",
            "promise_owner_invalid_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>6000 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>6000 removeAccount start====");
          await accountManager.removeAccount("promise_owner_invalid");
          hilog.info(0x0000, tag, "====>6000 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_6100
     * @tc.name       ActsAccountAuthToken_6100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>6100 start====");
        hilog.info(0x0000, tag, "====>6100 createAccount start====");
        accountManager.createAccount("account_callback_owner_empty", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>6100 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_owner_empty", "authType", "account_callback_owner_empty_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>6100 setAuthToken err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_owner_empty", "", "authType",
                "account_callback_owner_empty_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>6100 getAuthToken err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300002);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_owner_empty",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>6100 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>6100 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_6200
     * @tc.name       ActsAccountAuthToken_6200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>6200 start====");
        hilog.info(0x0000, tag, "====>6200 createAccount start====");
        await accountManager.createAccount("promise_owner_empty");
        hilog.info(0x0000, tag, "====>6200 setAuthToken start====");
        await accountManager.setAuthToken("promise_owner_empty", "authType",
          "promise_owner_empty_token");
        hilog.info(0x0000, tag, "====>6200 getAuthToken start====");
        try {
          await accountManager.deleteAuthToken("promise_owner_empty", "", "authType",
            "promise_owner_empty_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>6200 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>6200 removeAccount start====");
          await accountManager.removeAccount("promise_owner_empty");
          hilog.info(0x0000, tag, "====>6200 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_6300
     * @tc.name       ActsAccountAuthToken_6300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>6300 start====");
        hilog.info(0x0000, tag, "====>6300 createAccount start====");
        accountManager.createAccount("account_callback_owner_space", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>6300 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_owner_space", "authType", "account_callback_owner_space_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>6300 setAuthToken err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_owner_space", " ", "authType",
                "account_callback_owner_space_token", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>6300 getAuthToken err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300003);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_owner_space",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>6300 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>6300 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_6400
     * @tc.name       ActsAccountAuthToken_6400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>6400 start====");
        hilog.info(0x0000, tag, "====>6400 createAccount start====");
        await accountManager.createAccount("promise_owner_space");
        hilog.info(0x0000, tag, "====>6400 setAuthToken start====");
        await accountManager.setAuthToken("promise_owner_space", "authType",
          "promise_owner_space_token");
        hilog.info(0x0000, tag, "====>6400 getAuthToken start====");
        try {
          await accountManager.deleteAuthToken("promise_owner_space", " ", "authType",
            "promise_owner_space_token");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>6400 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>6400 removeAccount start====");
          await accountManager.removeAccount("promise_owner_space");
          hilog.info(0x0000, tag, "====>6400 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_6500
     * @tc.name       ActsAccountAuthToken_6500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitToken: string = '';
        for (let i: int = 0; i < TOKENLENGTHLIMIT + 1; i++) {
          limitToken += 'c';
        }
        hilog.info(0x0000, tag, "====>6500 start====");
        hilog.info(0x0000, tag, "====>6500 createAccount start====");
        accountManager.createAccount("account_callback_token_exceedLimit", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>6500 createAccount err: " + JSON.stringify(err));
          accountManager.deleteAuthToken("account_callback_token_exceedLimit", OWNERSELF, "authType", limitToken,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>6500 getAuthToken err: " + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_callback_token_exceedLimit",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>6500 removeAccount err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>6500 end====");
                  done();
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_6600
     * @tc.name       ActsAccountAuthToken_6600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitToken: string = '';
        for (let i: int = 0; i < TOKENLENGTHLIMIT + 1; i++) {
          limitToken += 'c';
        }
        hilog.info(0x0000, tag, "====>6600 start====");
        hilog.info(0x0000, tag, "====>6600 createAccount start====");
        await accountManager.createAccount("promise_token_exceedLimit");
        hilog.info(0x0000, tag, "====>6600 deleteAuthToken start====");
        try {
          await accountManager.deleteAuthToken("promise_token_exceedLimit", OWNERSELF, "authType", limitToken);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>6600 getAuthToken err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>6600 removeAccount start====");
          await accountManager.removeAccount("promise_token_exceedLimit");
          hilog.info(0x0000, tag, "====>6600 end====");
          done();
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_6700
     * @tc.name       ActsAccountAuthToken_6700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitToken: string = '';
        for (let i: int = 0; i < TOKENLENGTHLIMIT; i++) {
          limitToken += 'c';
        }
        hilog.info(0x0000, tag, "====>6700 start====");
        hilog.info(0x0000, tag, "====>6700 createAccount start====");
        accountManager.createAccount("account_callback_token_limit", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>6700 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_token_limit", "authType", limitToken,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>6700 setAuthToken err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              accountManager.deleteAuthToken("account_callback_token_limit", OWNERSELF, "authType", limitToken,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>6700 getAuthToken err: " + JSON.stringify(err));
                  try {
                    expect(err).assertEqual(null);
                  } catch (err) {
                    hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_callback_token_limit",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>6700 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>6700 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_6800
     * @tc.name       ActsAccountAuthToken_6800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        let limitToken: string = '';
        for (let i: int = 0; i < TOKENLENGTHLIMIT; i++) {
          limitToken += 'c';
        }
        hilog.info(0x0000, tag, "====>6800 start====");
        try {
          hilog.info(0x0000, tag, "====>6800 createAccount start====");
          await accountManager.createAccount("promise_token_limit");
          hilog.info(0x0000, tag, "====>6800 setAuthToken start====");
          await accountManager.setAuthToken("promise_token_limit", "authType", limitToken);
          hilog.info(0x0000, tag, "====>6800 deleteAuthToken start====");
          await accountManager.deleteAuthToken("promise_token_limit", OWNERSELF, "authType", limitToken);
          hilog.info(0x0000, tag, "====>6800 removeAccount start====");
          await accountManager.removeAccount("promise_token_limit");
          hilog.info(0x0000, tag, "====>6800 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_6800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_6900
     * @tc.name       ActsAccountAuthToken_6900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>6900 start====");
        hilog.info(0x0000, tag, "====>6900 createAccount start====");
        accountManager.createAccount("account_callback_delete_space", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>6900 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_callback_delete_space", "authType",
            "account_callback_delete_space_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>6900 setAuthToken err: " + JSON.stringify(err));
              accountManager.deleteAuthToken("account_callback_delete_space", OWNERSELF, "authType", "",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>6900 deleteAuthToken err: " + JSON.stringify(err));
                  accountManager.getAuthToken("account_callback_delete_space", OWNERSELF, "authType",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>6900 getAuthToken err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>6900 getAuthToken data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("account_callback_delete_space_token");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_callback_delete_space",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>6900 removeAccount err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>6900 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_7000
     * @tc.name       ActsAccountAuthToken_7000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>7000 start====");
        try {
          hilog.info(0x0000, tag, "====>7000 createAccount start====");
          await accountManager.createAccount("promise_delete_space");
          hilog.info(0x0000, tag, "====>7000 setAuthToken start====");
          await accountManager.setAuthToken("promise_delete_space", "authType",
            "promise_delete_space_token");
          hilog.info(0x0000, tag, "====>7000 deleteAuthToken start====");
          await accountManager.deleteAuthToken("promise_delete_space", OWNERSELF, "authType", "");
          hilog.info(0x0000, tag, "====>7000 getAuthToken start====");
          let data: string = await accountManager.getAuthToken("promise_delete_space", OWNERSELF, "authType");
          expect(data).assertEqual("promise_delete_space_token");
          hilog.info(0x0000, tag, "====>7000 removeAccount start====");
          await accountManager.removeAccount("promise_delete_space");
          hilog.info(0x0000, tag, "====>7000 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_7000 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_9200
     * @tc.name       ActsAccountAuthToken_9200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9200 start====");
        try {
          await accountManager.getAuthCallback("test_sessionId");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>9200 getAuthCalback err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300108);
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_9300
     * @tc.name       ActsAccountAuthToken_9300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9300 start====");
        try {
          await accountManager.getAuthCallback("");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>9300 getAuthCalback err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_9400
     * @tc.name       ActsAccountAuthToken_9400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9400 start====");
        try {
          await accountManager.getAuthCallback(" ");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>9400 getAuthCalback err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300108);
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_9500
     * @tc.name       ActsAccountAuthToken_9500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9500 start====");
        accountManager.queryAuthenticatorInfo(OWNERSELF, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>9500 queryAuthenticatorInfo err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300113);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_9600
     * @tc.name       ActsAccountAuthToken_9600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9600 start====");
        accountManager.queryAuthenticatorInfo("", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>9600 queryAuthenticatorInfo err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_9700
     * @tc.name       ActsAccountAuthToken_9700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9700 start====");
        accountManager.queryAuthenticatorInfo(" ", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>9700 queryAuthenticatorInfo err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300113);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_9800
     * @tc.name       ActsAccountAuthToken_9800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limiOwner: string = '';
        for (let i: int = 0; i < OWNERLENGTHLIMIT + 1; i++) {
          limiOwner += 't';
        }
        hilog.info(0x0000, tag, "====>9800 start====");
        accountManager.queryAuthenticatorInfo(limiOwner, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>9800 queryAuthenticatorInfo err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_9900
     * @tc.name       ActsAccountAuthToken_9900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>9900 start====");
        await accountManager.createAccount("account_setAuthTokenVisibility_name");
        hilog.info(0x0000, tag, "====>9900 start setAuthTokenVisibility");
        try {
          await accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "authType",
            valid_owner_name, true);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>9900 setAuthTokenVisibility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300107);
          accountManager.getAuthToken("account_setAuthTokenVisibility_name", OWNERSELF, "authType",
            (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>9900 getAuthToken err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>9900 getAuthToken data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300107);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.getAuthList("account_setAuthTokenVisibility_name", "authType",
                (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                  hilog.info(0x0000, tag, "====>9900 getAuthList err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300107);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_setAuthTokenVisibility_name",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>9900 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>9900 end====");
                      done();
                    });
                });
            });
        }
      });

    /**
     * @tc.number     ActsAccountAuthToken_10200
     * @tc.name       ActsAccountAuthToken_10200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>10200 start====");
        accountManager.createAccount("account_setAuthTokenVisibility_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>10200 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_setAuthTokenVisibility_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>10200 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "authType", "", true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>10200 setAuthTokenVisibility err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300002);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_setAuthTokenVisibility_name",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>10200 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>10200 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_10201
     * @tc.name       ActsAccountAuthToken_10201
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>10201 start====");
        accountManager.createAccount("account_setAuthTokenVisibility_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>10201 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_setAuthTokenVisibility_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>10201 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "authType", "", true).then(() => {
                hilog.info(0x0000, tag, '====>promise run err');
                expect().assertFail();
              }).catch((e: Error) => {
                  let err = e as BusinessError;
                  hilog.info(0x0000, tag, "====>10201 setAuthTokenVisibility err: " + err);
                  hilog.info(0x0000, tag, "====>10201 setAuthTokenVisibility err code: " + err.code);
                  try {
                    if (err) {
                      expect(err.code).assertEqual(12300002);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_setAuthTokenVisibility_name",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>10201 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>10201 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_10300
     * @tc.name       ActsAccountAuthToken_10300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>10300 start====");
        accountManager.createAccount("account_setAuthTokenVisibility_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>10300 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_setAuthTokenVisibility_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>10300 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "authType", " ", true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>10300 setAuthTokenVisibility err: " + JSON.stringify(err));
                  accountManager.getAuthList("account_setAuthTokenVisibility_name", "authType",
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>10300 getAuthList err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>10300 getAuthList data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data?.length).assertEqual(1);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_setAuthTokenVisibility_name",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>10300 removeAccount err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>10300 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_10400
     * @tc.name       ActsAccountAuthToken_10400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitBundleName: string = '';
        for (let i: int = 0; i < OWNERLENGTHLIMIT + 1; i++) {
          limitBundleName += 't';
        }
        hilog.info(0x0000, tag, "====>10400 start====");
        accountManager.createAccount("account_setAuthTokenVisibility_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>10400 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_setAuthTokenVisibility_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>10400 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "authType", limitBundleName,
                true, (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>10400 setAuthTokenVisibility err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300002);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_setAuthTokenVisibility_name",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>10400 removeAccount err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>10400 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_10500
     * @tc.name       ActsAccountAuthToken_10500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>10500 start====");
        accountManager.createAccount("account_setAuthTokenVisibility_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>10500 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_setAuthTokenVisibility_name", "", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>10500 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "", valid_owner_name, true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>10500 setAuthTokenVisibility err: " + JSON.stringify(err));
                  accountManager.getAuthList("account_setAuthTokenVisibility_name", "",
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>10500 getAuthList err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>10500 getAuthList data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data?.length).assertEqual(1);
                            let a: string = data[0];
                            expect(a).assertEqual(valid_owner_name);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.getAuthList("account_setAuthTokenVisibility_name", "authType",
                        (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                          hilog.info(0x0000, tag, "====>10500 getAuthList authType err: " + JSON.stringify(err));
                          try {
                            if (err) {
                              expect(err?.code).assertEqual(12300107);
                            } else {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            }
                          } catch (err) {
                            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                          }
                          accountManager.removeAccount("account_setAuthTokenVisibility_name",
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>10500 removeAccount err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>10500 end====");
                              done();
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_10600
     * @tc.name       ActsAccountAuthToken_10600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>10600 start====");
        accountManager.createAccount("account_setAuthTokenVisibility_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>10600 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_setAuthTokenVisibility_name", " ", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>10600 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", " ", valid_owner_name, true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>10600 setAuthTokenVisibility err: " + JSON.stringify(err));
                  accountManager.getAuthList("account_setAuthTokenVisibility_name", " ",
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>10600 getAuthList err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>10600 getAuthList data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data?.length).assertEqual(1);
                            let a: string = data[0];
                            expect(a).assertEqual(valid_owner_name);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.getAuthList("account_setAuthTokenVisibility_name", "authType",
                        (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                          hilog.info(0x0000, tag, "====>10600 getAuthList authType err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>10600 getAuthList authType data: " + JSON.stringify(data));
                          try {
                            if (err) {
                              expect(err?.code).assertEqual(12300107);
                            } else {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            }
                          } catch (err) {
                            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                          }
                          accountManager.removeAccount("account_setAuthTokenVisibility_name",
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>10600 removeAccount err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>10600 end====");
                              done();
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_10700
     * @tc.name       ActsAccountAuthToken_10700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 't';
        }
        hilog.info(0x0000, tag, "====>10700 start====");
        accountManager.createAccount("account_setAuthTokenVisibility_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>10700 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_setAuthTokenVisibility_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>10700 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", limitAuthType,
                "test_bundleName", true, (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>10700 setAuthTokenVisibility err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300002);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.getAuthList("account_setAuthTokenVisibility_name", "authType",
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>10700 getAuthList authType err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>10700 getAuthList authType data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data?.length).assertEqual(0);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_setAuthTokenVisibility_name",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>10700 removeAccount err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>10700 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_10800
     * @tc.name       ActsAccountAuthToken_10800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>10800 start====");
        accountManager.createAccount("account_setAuthTokenVisibility_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>10800 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_setAuthTokenVisibility_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>10800 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_setAuthTokenVisibility_name", "invalid_authType",
                valid_owner_name, true, (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>10800 setAuthTokenVisibility err: " + JSON.stringify(err));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12300107);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.getAuthList("account_setAuthTokenVisibility_name", "invalid_authType",
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>10800 getAuthList err: " + JSON.stringify(err));
                      try {
                        if (err) {
                          expect(err?.code).assertEqual(12300107);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      } catch (err) {
                        hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                      }
                      hilog.info(0x0000, tag, "====>10800 getAuthList data: " + JSON.stringify(data));
                      accountManager.getAuthList("account_setAuthTokenVisibility_name", "authType",
                        (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                          hilog.info(0x0000, tag, "====>10800 getAuthList authType err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>10800 getAuthList authType data: " + JSON.stringify(data));
                          try {
                            if (err) {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            } else {
                              if (data) {
                                expect(data?.length).assertEqual(0);
                              } else {
                                hilog.info(0x0000, tag, "====>run err");
                                expect().assertFail();
                              }
                            }
                          } catch (err) {
                            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                          }
                          accountManager.removeAccount("account_setAuthTokenVisibility_name",
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>10800 removeAccount err: " + JSON.stringify(err));
                              hilog.info(0x0000, tag, "====>10800 end====");
                              done();
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_10900
     * @tc.name       ActsAccountAuthToken_10900
     * @tc.desc       appAccount authToken scene testcases setAuthTokenVisibility callback
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>10900 start====");
        accountManager.setAuthTokenVisibility("", "authType", valid_owner_name, true,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>10900 setAuthTokenVisibility err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11000
     * @tc.name       ActsAccountAuthToken_11000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11000 start====");
        accountManager.setAuthTokenVisibility(" ", "authType", valid_owner_name, true,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>11000 setAuthTokenVisibility err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11001
     * @tc.name       ActsAccountAuthToken_11001
     * @tc.desc       appAccount authToken scene testcases setAuthTokenVisibility promise
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11001 start====");
        try {
          await accountManager.setAuthTokenVisibility(" ", "authType", valid_owner_name, true);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>11001 setAuthTokenVisibility err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_11100
     * @tc.name       ActsAccountAuthToken_11100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitName: string = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitName += 't';
        }
        hilog.info(0x0000, tag, "====>11100 start====");
        accountManager.setAuthTokenVisibility(limitName, "authType", valid_owner_name, true,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>11100 setAuthTokenVisibility err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11200
     * @tc.name       ActsAccountAuthToken_11200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11200 start====");
        accountManager.setAuthTokenVisibility("no_add_account", "authType", valid_owner_name, true,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>11200 setAuthTokenVisibility err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11300
     * @tc.name       ActsAccountAuthToken_11300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11300 start====");
        accountManager.checkAuthTokenVisibility("", "authType", valid_owner_name,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, "====>11300 checkAuthTokenVisibility err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11400
     * @tc.name       ActsAccountAuthToken_11400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11400 start====");
        accountManager.checkAuthTokenVisibility(" ", "authType", valid_owner_name,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, "====>11400 checkAuthTokenVisibility err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11500
     * @tc.name       ActsAccountAuthToken_11500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitName: string = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitName += 't';
        }
        hilog.info(0x0000, tag, "====>11500 start====");
        accountManager.checkAuthTokenVisibility(limitName, "authType", valid_owner_name,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, "====>11500 checkAuthTokenVisibility err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11501
     * @tc.name       ActsAccountAuthToken_11501
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitName: string = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitName += 't';
        }
        hilog.info(0x0000, tag, "====>11501 start====");
        accountManager.checkAuthTokenVisibility(limitName, "authType", valid_owner_name).then(() => {
          hilog.info(0x0000, tag, '====>promise run err');
          expect().assertFail();
        }).catch((e: Error) => {
          let err = e as BusinessError;
          hilog.info(0x0000, tag, "====>11501 checkAuthTokenVisibility err: " + err);
          hilog.info(0x0000, tag, "====>11501 checkAuthTokenVisibility err code: " + err.code);
          try {
            if (err) {
              expect(err.code).assertEqual(12300002);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11600
     * @tc.name       ActsAccountAuthToken_11600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11600 start====");
        accountManager.checkAuthTokenVisibility("no_add_account", "authType", valid_owner_name,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, "====>11600 checkAuthTokenVisibility err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11601
     * @tc.name       ActsAccountAuthToken_11601
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11601 start====");
        accountManager.checkAuthTokenVisibility("no_add_account", "authType", valid_owner_name).then(() => {
          hilog.info(0x0000, tag, '====>promise run err');
          expect().assertFail();
        }).catch((e: Error) => {
          let err = e as BusinessError;
          hilog.info(0x0000, tag, "====>11601 checkAuthTokenVisibility err: " + err);
          hilog.info(0x0000, tag, "====>11601 checkAuthTokenVisibility err code: " + err.code);
          try {
            if (err) {
              expect(err.code).assertEqual(12300003);
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11700
     * @tc.name       ActsAccountAuthToken_11700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11700 start====");
        accountManager.createAccount("account_checkAuthTokenVisibility_name",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>11700 createAccount err: " + JSON.stringify(err));
            accountManager.setAuthToken("account_checkAuthTokenVisibility_name", "", "test_token",
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>11700 setAuthToken err: " + JSON.stringify(err));
                accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "", valid_owner_name,
                  (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>11700 checkAuthTokenVisibility err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>11700 checkAuthTokenVisibility data: " + data);
                    try {
                      if (err) {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      } else {
                        expect(data).assertEqual(false);
                      }
                    } catch (err) {
                      hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                    }
                    accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "", OWNERSELF,
                      (err: BusinessError<void> | null, data: boolean | undefined): void => {
                        hilog.info(0x0000, tag, "====>11700 checkAuthTokenVisibility err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>11700 checkAuthTokenVisibility data: " + data);
                        try {
                          if (err) {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          } else {
                            if (data) {
                              expect(data).assertEqual(true);
                            } else {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            }
                          }
                        } catch (err) {
                          hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                        }
                        accountManager.removeAccount("account_checkAuthTokenVisibility_name",
                          (err: BusinessError<void> | null): void => {
                            hilog.info(0x0000, tag, "====>11700 removeAccount err: " + JSON.stringify(err));
                            hilog.info(0x0000, tag, "====>11700 end====");
                            done();
                          });
                      });
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11800
     * @tc.name       ActsAccountAuthToken_11800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>11800 start====");
        accountManager.createAccount("account_checkAuthTokenVisibility_name",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>11800 createAccount err: " + JSON.stringify(err));
            accountManager.setAuthToken("account_checkAuthTokenVisibility_name", " ", "test_token",
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>11800 setAuthToken err: " + JSON.stringify(err));
                accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", " ", valid_owner_name,
                  (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>11800 checkAuthTokenVisibility err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>11800 checkAuthTokenVisibility data: " + data);
                    try {
                      if (err) {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      } else {
                        expect(data).assertEqual(false);
                      }
                    } catch (err) {
                      hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                    }
                    accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", " ", OWNERSELF,
                      (err: BusinessError<void> | null, data: boolean | undefined): void => {
                        hilog.info(0x0000, tag, "====>11800 checkAuthTokenVisibility err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>11800 checkAuthTokenVisibility data: " + data);
                        try {
                          if (err) {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          } else {
                            if (data) {
                              expect(data).assertEqual(true);
                            } else {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            }
                          }
                        } catch (err) {
                          hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                        }
                        accountManager.removeAccount("account_checkAuthTokenVisibility_name",
                          (err: BusinessError<void> | null): void => {
                            hilog.info(0x0000, tag, "====>11800 removeAccount err: " + JSON.stringify(err));
                            hilog.info(0x0000, tag, "====>11800 end====");
                            done();
                          });
                      });
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_11900
     * @tc.name       ActsAccountAuthToken_11900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 't';
        }
        hilog.info(0x0000, tag, "====>11900 start====");
        accountManager.createAccount("account_checkAuthTokenVisibility_name",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>11900 createAccount err: " + JSON.stringify(err));
            accountManager.setAuthToken("account_checkAuthTokenVisibility_name", "authType", "test_token",
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>11900 setAuthToken err: " + JSON.stringify(err));
                accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", limitAuthType,
                  valid_owner_name, (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>11900 checkAuthTokenVisibility err: " + JSON.stringify(err));
                    try {
                      if (err) {
                        expect(err?.code).assertEqual(12300002);
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    } catch (err) {
                      hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                    }
                    accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", limitAuthType,
                      OWNERSELF, (err: BusinessError<void> | null, data: boolean | undefined): void => {
                        hilog.info(0x0000, tag, "====>11900 checkAuthTokenVisibility err: " + JSON.stringify(err));
                        try {
                          if (err) {
                            expect(err?.code).assertEqual(12300002);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        } catch (err) {
                          hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                        }
                        accountManager.removeAccount("account_checkAuthTokenVisibility_name",
                          (err: BusinessError<void> | null): void => {
                            hilog.info(0x0000, tag, "====>11900 removeAccount err: " + JSON.stringify(err));
                            hilog.info(0x0000, tag, "====>11900 end====");
                            done();
                          });
                      });
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12000
     * @tc.name       ActsAccountAuthToken_12000
     * @tc.desc       appAccount authToken scene testcases  checkAuthTokenVisibility callback 12300107
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12000 start====");
        accountManager.createAccount("account_checkAuthTokenVisibility_name",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>12000 createAccount err: " + JSON.stringify(err));
            accountManager.setAuthToken("account_checkAuthTokenVisibility_name", "authType", "test_token",
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>12000 setAuthToken err: " + JSON.stringify(err));
                accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "invalid_authType",
                  valid_owner_name, (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>12000 checkAuthTokenVisibility err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>12000 checkAuthTokenVisibility data: " + data);
                    try {
                      if (err) {
                        expect(err?.code).assertEqual(12300107);
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    } catch (err) {
                      hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                    }
                    accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "invalid_authType",
                      OWNERSELF, (err: BusinessError<void> | null, data: boolean | undefined): void => {
                        hilog.info(0x0000, tag, "====>12000 checkAuthTokenVisibility err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>12000 checkAuthTokenVisibility data: " + data);
                        try {
                          if (err) {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          } else {
                            if (data) {
                              expect(data).assertEqual(true);
                            } else {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            }
                          }
                        } catch (err) {
                          hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                        }
                        accountManager.removeAccount("account_checkAuthTokenVisibility_name",
                          (err: BusinessError<void> | null): void => {
                            hilog.info(0x0000, tag, "====>12000 removeAccount err: " + JSON.stringify(err));
                            hilog.info(0x0000, tag, "====>12000 end====");
                            done();
                          });
                      });
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12001
     * @tc.name       ActsAccountAuthToken_12001
     * @tc.desc       appAccount authToken scene testcases checkAuthTokenVisibility promise 12300107
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12001 start====");
        accountManager.createAccount("account_checkAuthTokenVisibility_name",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>12001 createAccount err: " + JSON.stringify(err));
            accountManager.setAuthToken("account_checkAuthTokenVisibility_name", "authType", "test_token", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>12001 setAuthToken err: " + JSON.stringify(err));
              accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "invalid_authType", valid_owner_name).then(() => {
                hilog.info(0x0000, tag, '====>promise run err');
                expect().assertFail();
              }).catch((e: Error) => {
                let err = e as BusinessError;
                hilog.info(0x0000, tag, "====>10201 setAuthTokenVisibility err: " + err);
                hilog.info(0x0000, tag, "====>10201 setAuthTokenVisibility err code: " + err.code);
                try {
                  if (err) {
                    expect(err.code).assertEqual(12300107);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "invalid_authType",
                  OWNERSELF, (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>12001 checkAuthTokenVisibility err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>12001 checkAuthTokenVisibility data: " + data);
                    try {
                      if (err) {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      } else {
                        if (data) {
                          expect(data).assertEqual(true);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      }
                    } catch (err) {
                      hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                    }
                    accountManager.removeAccount("account_checkAuthTokenVisibility_name",
                      (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>12001 removeAccount err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>12001 end====");
                        done();
                      });
                  });
                });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12100
     * @tc.name       ActsAccountAuthToken_12100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12100 start====");
        accountManager.createAccount("account_checkAuthTokenVisibility_name",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>12100 createAccount err: " + JSON.stringify(err));
            accountManager.setAuthToken("account_checkAuthTokenVisibility_name", "authType", "test_token",
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>12100 setAuthToken err: " + JSON.stringify(err));
                accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "authType", "",
                  (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>12100 checkAuthTokenVisibility err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>12100 checkAuthTokenVisibility data: " + data);
                    try {
                      if (err) {
                        expect(err?.code).assertEqual(12300002);
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    } catch (err) {
                      hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                    }
                    accountManager.removeAccount("account_checkAuthTokenVisibility_name",
                      (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>12100 removeAccount err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>12100 end====");
                        done();
                      });
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12200
     * @tc.name       ActsAccountAuthToken_12200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12200 start====");
        accountManager.createAccount("account_checkAuthTokenVisibility_name",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>12200 createAccount err: " + JSON.stringify(err));
            accountManager.setAuthToken("account_checkAuthTokenVisibility_name", "authType", "test_token",
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>12200 setAuthToken err: " + JSON.stringify(err));
                accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "authType", " ",
                  (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>12200 checkAuthTokenVisibility err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>12200 checkAuthTokenVisibility data: " + data);
                    try {
                      if (err) {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      } else {
                        expect(data).assertEqual(false);
                      }
                    } catch (err) {
                      hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                    }
                    accountManager.removeAccount("account_checkAuthTokenVisibility_name",
                      (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>12200 removeAccount err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>12200 end====");
                        done();
                      });
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12300
     * @tc.name       ActsAccountAuthToken_12300
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitBundleName: string = '';
        for (let i: int = 0; i < OWNERLENGTHLIMIT + 1; i++) {
          limitBundleName += 't';
        }
        hilog.info(0x0000, tag, "====>12300 start====");
        accountManager.createAccount("account_checkAuthTokenVisibility_name",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>12300 createAccount err: " + JSON.stringify(err));
            accountManager.setAuthToken("account_checkAuthTokenVisibility_name", "authType", "test_token",
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>12300 setAuthToken err: " + JSON.stringify(err));
                accountManager.checkAuthTokenVisibility("account_checkAuthTokenVisibility_name", "authType",
                  limitBundleName, (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>12300 checkAuthTokenVisibility err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>12300 checkAuthTokenVisibility data: " + data);
                    try {
                      if (err) {
                        expect(err?.code).assertEqual(12300002);
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    } catch (err) {
                      hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                    }
                    accountManager.removeAccount("account_checkAuthTokenVisibility_name",
                      (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>12300 removeAccount err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>12300 end====");
                        done();
                      });
                  });
              });
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12400
     * @tc.name       ActsAccountAuthToken_12400
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12400 start====");
        accountManager.createAccount("account_testgetAuthList_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>12400 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_testgetAuthList_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>12400 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_testgetAuthList_name", "authType", valid_owner_name, true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>12400 setAuthTokenVisibility err: " + JSON.stringify(err));
                  accountManager.getAuthList("account_testgetAuthList_name", "",
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>12400 getAuthList err: " + JSON.stringify(err));
                      try {
                        if (err) {
                          expect(err?.code).assertEqual(12300107);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      } catch (err) {
                        hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_testgetAuthList_name",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>12400 removeAccount err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>12400 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12500
     * @tc.name       ActsAccountAuthToken_12500
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12500 start====");
        accountManager.createAccount("account_testgetAuthList_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>12500 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_testgetAuthList_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>12500 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_testgetAuthList_name", "authType", valid_owner_name, true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>12500 setAuthTokenVisibility err: " + JSON.stringify(err));
                  accountManager.getAuthList("account_testgetAuthList_name", " ",
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>12500 getAuthList err: " + JSON.stringify(err));
                      try {
                        if (err) {
                          expect(err?.code).assertEqual(12300107);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      } catch (err) {
                        hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_testgetAuthList_name",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>12500 removeAccount err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>12500 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12501
     * @tc.name       ActsAccountAuthToken_12501
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12501 start====");
        accountManager.createAccount("account_testgetAuthList_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>12501 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_testgetAuthList_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>12501 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_testgetAuthList_name", "authType", valid_owner_name, true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>12501 setAuthTokenVisibility err: " + JSON.stringify(err));
                  accountManager.getAuthList("account_testgetAuthList_name", " ").then((data) => {
                    hilog.info(0x0000, tag, '====>promise run err');
                    expect().assertFail();
                  }).catch((e: Error) => {
                    let err = e as BusinessError;
                    hilog.info(0x0000, tag, "====>12501 getAuthList err: " + err);
                    hilog.info(0x0000, tag, "====>12501 getAuthList err code: " + err.code);
                    try {
                      if (err) {
                        expect(err.code).assertEqual(12300107);
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    } catch (err) {
                      hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                    }
                    accountManager.removeAccount("account_testgetAuthList_name",
                      (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>12501 removeAccount err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>12501 end====");
                        done();
                      });
                  });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12600
     * @tc.name       ActsAccountAuthToken_12600
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitAuthType: string = '';
        for (let i: int = 0; i < AUTHTYPELENGTHLIMIT + 1; i++) {
          limitAuthType += 't';
        }
        hilog.info(0x0000, tag, "====>12600 start====");
        accountManager.createAccount("account_testgetAuthList_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>12600 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_testgetAuthList_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>12600 setAuthToken err: " + JSON.stringify(err));
              accountManager.setAuthTokenVisibility("account_testgetAuthList_name", "authType", valid_owner_name, true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>12600 setAuthTokenVisibility err: " + JSON.stringify(err));
                  accountManager.getAuthList("account_testgetAuthList_name", limitAuthType,
                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                      hilog.info(0x0000, tag, "====>12600 getAuthList err: " + JSON.stringify(err));
                      try {
                        if (err) {
                          expect(err?.code).assertEqual(12300002);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      } catch (err) {
                        hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                      }
                      hilog.info(0x0000, tag, "====>12600 getAuthList data: " + JSON.stringify(data));
                      accountManager.removeAccount("account_testgetAuthList_name",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>12600 removeAccount err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>12600 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12700
     * @tc.name       ActsAccountAuthToken_12700
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12700 start====");
        try {
          let data: Array<string> = await accountManager.getAuthList("", "authType");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountAuthToken_12700 fail err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     ActsAccountAuthToken_12800
     * @tc.name       ActsAccountAuthToken_12800
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>12800 start====");
        accountManager.getAuthList(" ", "authType",
          (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
            hilog.info(0x0000, tag, "====>12800 getAuthList err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>12800 getAuthList data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_12900
     * @tc.name       ActsAccountAuthToken_12900
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let limitName: string = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitName += 't';
        }
        hilog.info(0x0000, tag, "====>12900 start====");
        accountManager.getAuthList(limitName, "authType",
          (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
            hilog.info(0x0000, tag, "====>12900 getAuthList err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>12900 getAuthList data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_13000
     * @tc.name       ActsAccountAuthToken_13000
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>13000 start====");
        accountManager.getAuthList("no_add_account", "authType",
          (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
            hilog.info(0x0000, tag, "====>13000 getAuthList err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>13000 getAuthList data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountAuthToken_13100
     * @tc.name       ActsAccountAuthToken_13100
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>13100 start====");
        accountManager.createAccount("account_tokenTest_name", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>13100 createAccount err: " + JSON.stringify(err));
          accountManager.setAuthToken("account_tokenTest_name", "authType", "test_token",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>13100 setAuthToken err: " + JSON.stringify(err));
              accountManager.getAuthToken("account_tokenTest_name", OWNERSELF, "authType",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>13100 getAuthToken err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>13100 getAuthToken data: " + data);
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("test_token");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.checkAuthTokenVisibility("account_tokenTest_name", "authType", valid_owner_name,
                    (err: BusinessError<void> | null, data: boolean | undefined): void => {
                      hilog.info(0x0000, tag, "====>13100 checkAuthTokenVisibility err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>13100 checkAuthTokenVisibility data: " + data);
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          expect(data).assertEqual(false);
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.getAuthList("account_tokenTest_name", "authType",
                        (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                          hilog.info(0x0000, tag, "====>13100 getAuthList err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>13100 getAuthList data: " + JSON.stringify(data));
                          try {
                            if (err) {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            } else {
                              if (data) {
                                expect(data?.length).assertEqual(0);
                              } else {
                                hilog.info(0x0000, tag, "====>run err");
                                expect().assertFail();
                              }
                            }
                          } catch (err) {
                            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                          }
                          accountManager.setAuthTokenVisibility("account_tokenTest_name", "authType", valid_owner_name,
                            true,
                            (err: BusinessError<void> | null): void => {
                              hilog.info(0x0000, tag, "====>13100 setAuthTokenVisibility err: " + JSON.stringify(err));
                              accountManager.checkAuthTokenVisibility("account_tokenTest_name", "authType",
                                valid_owner_name,
                                (err: BusinessError<void> | null, data: boolean | undefined): void => {
                                  hilog.info(0x0000, tag, "====>13100 check err: " + JSON.stringify(err));
                                  hilog.info(0x0000, tag, "====>13100 checkAuthTokenVisibility data: " + data);
                                  try {
                                    if (err) {
                                      hilog.info(0x0000, tag, "====>run err");
                                      expect().assertFail();
                                    } else {
                                      if (data) {
                                        expect(data).assertEqual(true);
                                      } else {
                                        hilog.info(0x0000, tag, "====>run err");
                                        expect().assertFail();
                                      }
                                    }
                                  } catch (err) {
                                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                                  }
                                  accountManager.getAuthList("account_tokenTest_name", "authType",
                                    (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
                                      hilog.info(0x0000, tag, "====>13100 getAuthList err: " + JSON.stringify(err));
                                      hilog.info(0x0000, tag, "====>13100 getAuthList data: " + JSON.stringify(data));
                                      try {
                                        if (err) {
                                          hilog.info(0x0000, tag, "====>run err");
                                          expect().assertFail();
                                        } else {
                                          if (data) {
                                            expect(data?.length).assertEqual(1);
                                            let a: string = data[0];
                                            expect(a).assertEqual(valid_owner_name);
                                          } else {
                                            hilog.info(0x0000, tag, "====>run err");
                                            expect().assertFail();
                                          }
                                        }
                                      } catch (err) {
                                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                                      }
                                      accountManager.removeAccount("account_tokenTest_name",
                                        (err: BusinessError<void> | null): void => {
                                          hilog.info(0x0000, tag, "====>13100 remove err: " + JSON.stringify(err));
                                          hilog.info(0x0000, tag, "====>13100 end====");
                                          done();
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
      });

    /**
     * @tc.number     ActsAccountAuthToken_13200
     * @tc.name       ActsAccountAuthToken_13200
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountAuthToken_13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>13200 start====");
        accountManager.queryAuthenticatorInfo("com.example.actsaccountOauthtoken",
          (err: BusinessError<void> | null, data: account.AuthenticatorInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>13200 queryAuthenticatorInfo err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>13200 queryAuthenticatorInfo dataInfo: " + JSON.stringify(data));
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  expect(data?.iconId).assertLargerOrEqual(0);
                  expect(data?.labelId).assertLargerOrEqual(0);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
     * @tc.number     ActsAccountOAuthToken_13201
     * @tc.name       ActsAccountOAuthToken_13201
     * @tc.desc       appAccount authToken scene testcases
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 3
     */
    it('ActsAccountOAuthToken_13201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountOAuthToken_13201 start====");
        try {
          let data: account.AuthenticatorInfo =
            await accountManager.queryAuthenticatorInfo("com.example.actsaccountOauthtoken");
          hilog.info(0x0000, tag, "====>13201 queryAuthenticatorInfo dataInfo: " + JSON.stringify(data));
          expect(data.iconId >= 0).assertTrue();
          expect(data.labelId >= 0).assertTrue();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>13201 queryAuthenticatorInfo err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
  })
}
