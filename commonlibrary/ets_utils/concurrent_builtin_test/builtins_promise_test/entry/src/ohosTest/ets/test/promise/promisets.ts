/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export const testObject18 = { id: 1, name: 'test' };

export const promise18: Promise<{ id: number; name: string }> = new Promise<{ id: number; name: string }>((resolve) => {
  resolve(testObject18);
});


export const invalidExecutors17: (number | string | boolean | object | null)[] = [123, 'not function', true, {}, null];

export const result13 = async () => {
  return await Promise.resolve({ count: 5 })
    .then(obj => ({ ...obj, count: obj.count * 3 }))
    .then(obj => obj.count + 2);
}

export const testObj33 = { a: 1, b: 'test' };

export type type33 = { a: number; b: string }

export const user12 = { id: 1, name: 'Bob' };

export const emptyObj = {};

export const thenable44 = {
  then: 'not a function'
};

export type type44 = { then: string }

export const testObj32 = { key: 'value', num: 100 };

export const testObj32init = { key: '1', num: 10110 };

export type type79 = { id: number; value: number }

export type type85 = { id: number; name: string }

export type type85_2 = { id: number; title: string }[]

export const AsyncRejectThenable37 = {
  then: (onFulfilled: any, onRejected: any) => {
    setTimeout(() => {
      onRejected('Async thenable rejection');
    }, 25);
  }
};


export type type39 = { id: number }

export const AsyncRejectThenable53 = {
  then: (onFulfilled: any, onRejected: any) => {
    setTimeout(() => {
      onRejected('Async thenable failed');
    }, 25);
  }
};

export const FaultyThenable64 = {
  then: (onFulfilled: any, onRejected: any) => {
    throw new Error('Thenable sync exception');
  }
};

export async function PromiseCatchTest090() {
  let bookingError: string = '';
  let bookingResult: string = '';

  // Mock booking service with date validation and booking creation
  const bookingService = {
    validateDate: (dateStr: string): Promise<Date> => {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          const date = new Date(dateStr);
          // Validate if date is valid (invalid if getTime() returns NaN)
          if (isNaN(date.getTime())) {
            reject(`Invalid date: ${dateStr} (required format: YYYY-MM-DD)`);
          }
          resolve(date);
        }, 15);
      });
    },
    createBooking: (details: { userId: number; date: Date }): Promise<string> => {
      return new Promise((resolve) => {
        setTimeout(() => {
          resolve(`Booking confirmed for user ${details.userId} on ${details.date.toLocaleDateString()}`);
        }, 10);
      });
    }
  };

  // Booking workflow: validate date → create booking (with invalid date input)
  const bookingDetails = {
    userId: 101,
    date: '2024-13-01' // Invalid month (13 is out of range for months 1-12)
  };

  await bookingService.validateDate(bookingDetails.date)
    .then((validDate: Date) => {
      // Proceed to create booking if date is valid (unreachable here)
      return bookingService.createBooking({
        ...bookingDetails, date: validDate
      });
    })
    .then((confirmation: string) => {
      bookingResult = confirmation;
    })
    .catch((err: string) => {
      bookingError = err;
      // Suggest next valid date (2025-01-01) as fallback on failure
      bookingResult = `Booking failed. Suggested date: 2025-01-01 (valid format)`;
    });

  return bookingError == 'Invalid date: 2024-13-01 (required format: YYYY-MM-DD)' &&
    bookingResult == 'Booking failed. Suggested date: 2025-01-01 (valid format)'
  ;
}

export async function PromiseCatchTest071(): Promise<boolean> {
  let errorMsg: string = '';
  let fallbackData: { id: number; name: string } | null = null;

  const fetchUser = (userId: number): Promise<{ id: number; name: string }> => {
    return new Promise((_, reject) => {
      setTimeout(() => reject(`404: User ${userId} not found`), 30);
    });
  };

  await fetchUser(999)
    .then((user) => {
      return {
        ...user, isActive: true
      };
    })
    .catch((err) => {
      errorMsg = err;
      return {
        id: 0, name: 'Guest User'
      };
    })
    .then((data) => {
      fallbackData = data;
    });

  return (
    errorMsg === '404: User 999 not found' &&
      JSON.stringify(fallbackData) === JSON.stringify({ id: 0, name: 'Guest User' })
  );
}

export const fetchAndParseData72 = (): Promise<number[]> => {
  return new Promise((resolve) => {
    // Resolve with non-JSON string (simulate malformed response)
    setTimeout(() => resolve('invalid-json-data'), 20);
  }).then((raw: string) => {
    try {
      return JSON.parse(raw); // Throws parsing error
    } catch (err) {
      throw new Error(`Parse failed: ${(err as Error).message}`);
    }
  });
};

export const db74 = {
  connect: (): Promise<void> => Promise.resolve(),
  insert: (table: string, data: any): Promise<number> => {
    return new Promise((_, reject) => {
      // Simulate unique constraint violation
      setTimeout(() => reject(`Duplicate entry for table ${table}: ${data.id}`), 25);
    });
  },
  disconnect: (): Promise<void> => Promise.resolve()
};

export type type99 = { step: string; time: number }

export type type80 = { send: (msg: string) => void }

export type type75 = { email: string; password: string }

export let obj75 = {
  email: 'invalid-email', password: '123'
}

export const paymentService76 = {
  createOrder: (amount: number): Promise<string> => {
    return new Promise((resolve) => {
      setTimeout(() => resolve(`ORDER_${Date.now()}`), 15);
    });
  },
  processPayment: (orderId: string, card: string): Promise<{ success: boolean }> => {
    return new Promise((_, reject) => {
      // Simulate third-party service downtime
      setTimeout(() => reject(`Payment gateway unavailable for ${orderId}`), 25);
    });
  }
};

export const fs77 = {
  readFile: (path: string): Promise<string> => {
    return new Promise((_, reject) => {
      // Simulate file not found
      setTimeout(() => reject(`ENOENT: No such file or directory, open '${path}'`), 30);
    });
  },
  readFileSync: (path: string): string => {
    return 'Fallback content from cache';
  }
};


export async function PromiseCatchTest078(): Promise<boolean> {
  let authError: string = '';
  let userData: { id: number; role: string } | null = null;

  // Mock auth + protected API workflow (realistic auth flow)
  const authService = {
    login: (cred: { username: string; password: string }): Promise<string> => {
      return new Promise((_, reject) => {
        // Simulate invalid credentials
        setTimeout(() => reject('Invalid username or password'), 20);
      });
    },
    getProfile: (token: string): Promise<{ id: number; role: string }> => {
      return new Promise((resolve) => {
        setTimeout(() => resolve({
          id: 1, role: 'admin'
        }), 15);
      });
    }
  };
  let user = {
    id: -1, role: 'unauthenticated'
  };
  // Auth workflow: login → get protected profile
  await authService.login({
    username: 'bob', password: 'wrongpass'
  })
    .then((token) => authService.getProfile(token))
    .then((profile) => {
      userData = profile;
    })
    .catch((err: string) => {
      authError = err;
      userData = user // Fallback role
    });


  return authError === 'Invalid username or password' &&
    userData === user
}

export async function PromiseCatchTest082(): Promise<boolean> {
  let calcError = '';
  let result = null;

  const calculator = {
    validateInputs: (a, b) => {
      return new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          if (typeof a !== 'number' || typeof b !== 'number') {
            reject(`Invalid inputs: Expected numbers, got ${typeof a} and ${typeof b}`);
          }
          if (b === 0) {
            reject('Division by zero is not allowed');
          }
          resolve();
        }, 15);
      });
    },
    divide: (a, b) => {
      return new Promise((resolve) => {
        setTimeout(() => resolve(a / b), 10);
      });
    }
  };

  await calculator.validateInputs(10, '5')
    .then(() => calculator.divide(10, '5'))
    .then((res) => {
      result = res;
    })
    .catch((err) => {
      calcError = err;
      result = 0;
    });

  return (
    calcError === 'Invalid inputs: Expected numbers, got number and string' &&
      result === 0
  );
}

export async function PromiseCatchTest083(): Promise<boolean> {
  let authError = '';
  let apiData = null;

  const apiClient = {
    getToken: () => 'expired_token_123',
    fetchUserData: (token) => {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          if (token.includes('expired')) {
            reject('401: Unauthorized - Token expired');
          }
          resolve({ id: 1, name: 'Alice' });
        }, 20);
      });
    }
  };

  await Promise.resolve(apiClient.getToken())
    .then((token) => apiClient.fetchUserData(token))
    .then((data) => {
      apiData = data;
    })
    .catch((err) => {
      authError = err;
      apiData = { id: -1, name: 'Guest' };
    });

  return (
    authError === '401: Unauthorized - Token expired' &&
      JSON.stringify(apiData) === JSON.stringify({ id: -1, name: 'Guest' })
  );
}

export async function PromiseCatchTest084(): Promise<boolean> {
  let batchError = '';
  let processedCount = 0;

  const processUser = (user) => {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        if (user.id === 3) {
          reject(`Failed to process user ${user.id}: Missing required field`);
        }
        resolve(user);
      }, 10);
    });
  };

  const users = [
    { id: 1, name: 'Bob' },
    { id: 2, name: 'Charlie' },
    { id: 3 },
    { id: 4, name: 'Diana' }
  ];

  await Promise.all(users.map(user => processUser(user)))
    .then((processedUsers) => {
      processedCount = processedUsers.length;
    })
    .catch((err) => {
      batchError = err;
      processedCount = users.findIndex(u => u.id === 3);
    });

  return (
    batchError === 'Failed to process user 3: Missing required field' &&
      processedCount === 2
  );
}

export async function PromiseCatchTest085(): Promise<boolean> {
  let chatError = '';
  let connectionState = 'disconnected';

  const chatService = {
    connect: (roomId) => {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          reject(`Failed to join room ${roomId}: Network timeout`);
        }, 30);
      });
    },
    getOfflineMessages: (roomId) => {
      return new Promise((resolve) => {
        setTimeout(() => resolve(['Offline message 1', 'Offline message 2']), 15);
      });
    }
  };

  await chatService.connect('general-chat')
    .then(() => {
      connectionState = 'connected';
      return chatService.getOfflineMessages('general-chat');
    })
    .catch((err) => {
      chatError = err;
      connectionState = 'offline';
      return chatService.getOfflineMessages('general-chat');
    })
    .then((messages: Object[]) => {
      connectionState = `${connectionState} (${messages.length} offline msgs)`;
    });

  return (
    chatError === 'Failed to join room general-chat: Network timeout' &&
      connectionState === 'offline (2 offline msgs)'
  );
}

export async function PromiseCatchTest086(): Promise<boolean> {
  let configError = '';
  let appConfig = null;

  const loadConfig = (path) => {
    return new Promise((resolve) => {
      setTimeout(() => resolve('{ "apiUrl": "https://example.com", "timeout": }'), 20);
    }).then((rawConfig: string) => {
      try {
        return JSON.parse(rawConfig);
      } catch (err) {
        throw new Error(`Invalid config JSON: ${err.message}`);
      }
    });
  };

  await loadConfig('/config/app.json')
    .then((config) => {
      appConfig = config;
    })
    .catch((err) => {
      configError = err.message;
      appConfig = { apiUrl: 'https://default.example.com', timeout: 5000 };
    });

  return (
    configError.includes('Invalid config JSON: Unexpected token } in JSON at position') &&
      JSON.stringify(appConfig) === JSON.stringify({ apiUrl: 'https://default.example.com', timeout: 5000 })
  );
}

export async function PromiseCatchTest087(): Promise<boolean> {
  let emailError = '';
  let notificationStatus = 'pending';

  const emailService = {
    send: (to, subject, body) => {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          reject(`Failed to send email to ${to}: SMTP server unavailable`);
        }, 25);
      });
    },
    queueForLater: (emailData) => {
      return new Promise((resolve) => {
        setTimeout(() => resolve(`Queued email to ${emailData.to}`), 10);
      });
    }
  };

  const emailData = {
    to: 'user@example.com',
    subject: 'Order Confirmation',
    body: 'Thank you for your order!'
  };

  await emailService.send(emailData.to, emailData.subject, emailData.body)
    .then(() => {
      notificationStatus = 'sent';
    })
    .catch((err) => {
      emailError = err;
      return emailService.queueForLater(emailData);
    })
    .then((queueMsg: string) => {
      notificationStatus = queueMsg;
    });

  return (
    emailError === 'Failed to send email to user@example.com: SMTP server unavailable' &&
      notificationStatus === 'Queued email to user@example.com'
  );
}

export async function PromiseCatchTest088(): Promise<boolean> {
  let uploadError = '';
  let uploadStatus = 'failed';

  const uploadService = {
    validateSize: (fileSize) => {
      return new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          if (fileSize > 5 * 1024 * 1024) {
            reject(`File too large: ${fileSize} bytes (max 5MB)`);
          }
          resolve();
        }, 15);
      });
    },
    upload: (file) => {
      return new Promise((resolve) => {
        setTimeout(() => resolve(`Uploaded ${file.name}`), 20);
      });
    }
  };

  const file = { name: 'large_file.zip', size: 6 * 1024 * 1024 };

  await uploadService.validateSize(file.size)
    .then(() => uploadService.upload(file))
    .then((msg: string) => {
      uploadStatus = msg;
    })
    .catch((err) => {
      uploadError = err;
      uploadStatus = 'rejected';
    });

  return (
    uploadError === 'File too large: 6291456 bytes (max 5MB)' &&
      uploadStatus === 'rejected'
  );
}

export async function PromiseCatchTest089(): Promise<boolean> {
  let serviceError = '';
  let orderStatus = 'unprocessed';

  const services = {
    inventory: {
      checkStock: (productId) => {
        return new Promise((resolve, reject) => {
          setTimeout(() => {
            reject(`Inventory service unavailable for product ${productId}`);
          }, 20);
        });
      }
    },
    orders: {
      create: (orderData) => {
        return new Promise((resolve) => {
          setTimeout(() => resolve(`Order ${orderData.id} created`), 15);
        });
      }
    }
  };

  const orderData = { id: 'ORD-001', productId: 'PROD-123', quantity: 2 };
  await services.inventory.checkStock(orderData.productId)
    .then(() => services.orders.create(orderData))
    .then((msg: string) => {
      orderStatus = msg;
    })
    .catch((err) => {
      serviceError = err;
      orderStatus = 'on_hold';
    });

  return (
    serviceError === 'Inventory service unavailable for product PROD-123' &&
      orderStatus === 'on_hold'
  );
}


export const rejectMsg = 'thenable failed';

export const faultyThenable28 = {
  then: (_, reject: (reason: Error) => void) => {
    setTimeout(() => reject(new Error(rejectMsg)), 20);
  }
};

export async function PromiseFinallyTest040() {
  const executionLog40: string[] = [];

  await Promise.resolve('init')
    .then((val: string) => { // Sync then
      executionLog40.push(`sync then1: ${val}`);
      return 'step1';
    })
    .finally(() => {
      executionLog40.push('finally1');
    })
    .then((val: string) => { // Async then
      return new Promise(resolve => {
        setTimeout(() => {
          executionLog40.push(`async then2: ${val}`);
          resolve('step2');
        }, 10);
      });
    })
    .finally(() => {
      executionLog40.push('finally2');
    })
    .then((val: string) => { // Sync then
      executionLog40.push(`sync then3: ${val}`);
    });
  return executionLog40
}


export async function PromiseFinallyTest042() {
  const executionLog: string[] = [];

  await Promise.resolve('outer')
    .then((val) => {
      executionLog.push(`outer then: ${val}`);
      return new Promise((resolve) => {
        setTimeout(() => {
          executionLog.push('inner promise resolve');
          resolve('inner');
        }, 10);
      }).finally(() => {
        executionLog.push('inner finally');
      });
    })
    .finally(() => {
      executionLog.push('outer finally');
    });
  return executionLog
}


export async function PromiseFinallyTest087() {
  let originalUIState = { filter: 'all', disabled: false };
  let currentUIState = { ...originalUIState };
  const mockFilterData = async (filter: string): Promise<void> => {
    await new Promise<void>(resolve => setTimeout(resolve, 20));
    if (filter === 'invalid') {
      throw new Error('invalid filter');
    }
  };

  // Simulate filter flow: disable UI → apply filter → restore UI
  const applyFilter = async (filter: string): Promise<void> => {
    currentUIState = { filter, disabled: true }; // Update UI state
    await mockFilterData(filter)
      .finally(() => {
        currentUIState = { ...originalUIState }; // Restore on complete/fail
      });
  };

  try {
    await applyFilter('invalid');
  } catch {
  }

  return currentUIState.filter == originalUIState.filter &&
    currentUIState.disabled == originalUIState.disabled; // UI restored after error
}


export type type82 = { query: () => Promise<void>, release: () => void }

export type type62 = { step: string; time: number }

export type type68 = { event: string; elapsed: number }

export let obj91 = { hidden: true }

export let obj91_2 = { id: 1, name: 'Alice' }

export type type11 = { id: number }

export type type11_2 = { name: string }

export const thenable08_1 = {
  then: (onFulfilled: (value: string) => void) => onFulfilled('thenable1')
};

export const thenable08_2 = {
  then: (onFulfilled: (value: number) => void) => onFulfilled(100)
};

export const thenable16_1 = {
  then: (onFulfilled: (value: number) => void) => {
    return new Promise<number>((resolve) => {
      setTimeout(() => onFulfilled(10), 10);
    });
  }
};

export const thenable16_2 = {
  then: (onFulfilled: (value: string) => void) => {
    return new Promise<string>((resolve) => {
      setTimeout(() => onFulfilled('thenable'), 20);
    });
  }
};

export const thenable34 = {
  then: (onFulfilled: (value: string) => void) => {
    setTimeout(() => onFulfilled('processed'), 10);
  }
};


export async function PromiseAllTest073() {
  const log: string[] = [];
  const thenable1 = {
    then: (onFulfilled: (value: number) => void) => {
      log.push('thenable1 start');
      setTimeout(() => {
        log.push('thenable1 resolved');
        onFulfilled(1);
      }, 10);
    }
  };

  const thenable2 = await {
    then: (onFulfilled: (value: number) => void) => {
      log.push('thenable2 start');
      setTimeout(() => {
        log.push('thenable2 resolved');
        onFulfilled(2);
      }, 5);
    }
  }


  const p1: Promise<number> = Promise.resolve(thenable1);
  const p2: Promise<number> = p1.then((val: number) => {
    return new Promise<number>(resolve => {
      setTimeout(() => resolve(val + thenable2), 10);
    });
  });

  const result = await Promise.all([p1, p2]);
  if (result[0] !== 1 || result[1] !== 3) {
    return []
  }
  ;
  return log
}

export async function PromiseAllTest090() {
  const thenable1 = {
    then: (onFulfilled: (v: number) => void) => {
      setTimeout(() => onFulfilled(1), 10);
    }
  };

  const thenable2 = {
    then: async (onFulfilled: (v: number) => void) => {
      await new Promise<number>(resolve => setTimeout(resolve, 15));
      onFulfilled(2);
    }
  };

  const p1 = Promise.resolve(thenable1);
  const p2 = p1.then(val => Promise.resolve(thenable2).then(v => val + v));

  const result = await Promise.all([p1, p2]);
  return result
}

export async function PromiseAllTest055() {
  const thenable55 = {
    then: (_, onRejected: (e: Error) => void) => {
      onRejected(new Error('thenable error'));
    }
  };
  const p1 = Promise.resolve(thenable55)
    .catch((err: Error) => {
      return `caught: ${err.message}`
    });
  const p2: Promise<string> = Promise.reject(new Error('promise error'))
    .catch((err: Error) => `handled: ${err.message}`);

  const result = await Promise.all([p1 as Promise<string>, p2]) as string[];
  return result
}

export enum State66 { INIT, RUNNING, COMPLETE }

export type type66 = { delay: number, state: State66 }

export type type12 = { id: number }

export type type27 = { id: string, value: string }

export type type90 = { id: number, time: number }

export let obj40 = { name: "test" }


export const thenable27_1 = {
  then: (resolve: (value: number) => void) => {
    setTimeout(() => resolve(1), 50);
  }
};

export const thenable27_2 = {
  then: (resolve: (value: number) => void) => {
    setTimeout(() => resolve(2), 30);
  }
};

export async function PromiseRaceTest033() {

  async function* asyncGenerator(delay: number, value: number) {
    await new Promise<void>(resolve => setTimeout(resolve, delay));
    yield value;
  }

  const p1: Promise<number> = (async () => {
    for await (const val of asyncGenerator(240, 1)) {
      return val;
    }
    return -1;
  })();

  const p2: Promise<number> = (async () => {
    for await (const val of asyncGenerator(20, 2)) {
      return val;
    }
    return -1;
  })();

  const result = await Promise.race([p1, p2]);
  return result
}

export let obj34 = {
  ready: false
};

export let obj65 = { p1: 0, p2: 0 }

export const customThenable42_1 = {
  then: function (resolve: (value: number) => void) {
    setTimeout(() => resolve(1), 150);
  }
};

export const customThenable42_2 = {
  then: function (resolve: (value: number) => void, reject: () => void) {
    setTimeout(() => resolve(2), 30);
  }
};

export async function PromiseRaceTest057() {

  async function* delayGenerator(delay: number, value: number) {
    await new Promise<void>(resolve => setTimeout(resolve, delay));
    yield value;
  }

  let processGenerator = async (generator: AsyncGenerator<number>, multiplier: number): Promise<number> => {
    let result = 0;
    for await (const value of generator) {
      result += value * multiplier;
      await new Promise<void>(resolve => setTimeout(resolve, 10));
    }
    return result;
  }

  const p1: Promise<number> = processGenerator(delayGenerator(200, 5), 2);
  const p2: Promise<number> = processGenerator(delayGenerator(15, 3), 3);

  const result = await Promise.race([p1, p2]);
  return result
}

export async function PromiseRaceTest068() {

  async function* timedYield(value: number, count: number, delay: number) {
    for (let i = 0; i < count; i++) {
      await new Promise<void>(resolve => setTimeout(resolve, delay));
      yield value * (i + 1);
    }
  }

  const p1: Promise<number> = (async () => {
    for await (const val of timedYield(2, 3, 100)) {
      if (val === 4) {
        return val;
      } // Return on second yield
    }
    return -1;
  })(); // ~20ms (10*2)

  const p2: Promise<number> = (async () => {
    for await (const val of timedYield(3, 2, 15)) {
      if (val === 3) {
        return val;
      } // Return on first yield
    }
    return -1;
  })(); // ~15ms

  const result = await Promise.race([p1, p2]);
  return result
}

export async function PromiseRaceTest066() {
  let stateMachine = (id: number, transitions: Array<type66>): Promise<number> => {
    let currentState = State66.INIT;
    let transitionIndex = 0;

    return new Promise<number>(resolve => {
      const processTransition = () => {
        if (transitionIndex >= transitions.length) {
          resolve(id);
          return;
        }

        const { delay, state } = transitions[transitionIndex];
        currentState = state;
        transitionIndex++;

        setTimeout(processTransition, delay);
      };

      processTransition();
    });
  }

  // State transitions with cumulative delays
  const p1: Promise<number> = stateMachine(1, [
    { delay: 10, state: State66.RUNNING },
    { delay: 200, state: State66.RUNNING },
    { delay: 15, state: State66.COMPLETE }
  ]); // Total ~45ms

  const p2: Promise<number> = stateMachine(2, [
    { delay: 5, state: State66.RUNNING },
    { delay: 15, state: State66.RUNNING },
    { delay: 20, state: State66.COMPLETE }
  ]); // Total ~40ms

  const result = await Promise.race([p1, p2]);
  return result
}

export let obj84 = { value: 0 }

export type type86 = { value: number; expiry: number }

export async function PromiseRaceTest077() {
  class AsyncSignaler {
    private callback?: (data: number) => void;

    // Store direct callback instead of using listener array
    setCallback(callback: (data: number) => void) {
      this.callback = callback;
    }

    // Trigger the stored callback if it exists
    signal(data: number) {
      if (this.callback) {
        this.callback(data);
      }
    }
  }

  const signaler1 = new AsyncSignaler();
  const p1: Promise<number> = new Promise<number>(resolve => {
    signaler1.setCallback(resolve);
    // Send signal with value 1 after 40ms
    setTimeout(() => signaler1.signal(1), 40);
  });

  // Create second signaler and associated promise
  const signaler2 = new AsyncSignaler();
  const p2: Promise<number> = new Promise<number>(resolve => {
    signaler2.setCallback(resolve);
    // Send signal with value 2 after 20ms
    setTimeout(() => signaler2.signal(2), 200);
    // Send signal with value 3 after 10ms (will resolve first)
    setTimeout(() => signaler2.signal(3), 10);
  });

  // Race to get first resolved promise
  const result = await Promise.race([p1, p2]);
  return result
}

export type type14 = { id: number; name: string }

export type type38 = { value: null | string }

export type type38_2 = { value: null }

export type type38_3 = { value: null | string }

export type type22 = { value: null | string }

export const nonErrorReason03 = { code: 404, message: 'Resource not found' };

export type type51 = {
  field: string;
  message: string;
}

export async function PromiseResolveTest003() {
  let thenCalled = false;
  const thenable = {
    then(resolve: (value: string) => void) {
      thenCalled = true;
      resolve('thenable resolved');
    }
  };

  const promise = Promise.resolve(thenable);
  const result = await promise;

  return thenCalled && result == 'thenable resolved';
}


export async function PromiseResolveTest006() {
  const objWithThen = {
    name: 'test',
    then(resolve: (value: string) => void, reject: (err: Error) => void) {
      setTimeout(() => {
        if (this.name) {
          resolve(this.name);
        } else {
          reject(new Error('no name'));
        }
      }, 10);
    }
  };

  const promise = Promise.resolve(objWithThen);
  const result = await promise;
  return result
}

export type type10 = { data: string }

export const rejectingThenable11 = {
  then(_: () => void, reject: (err: string) => void) {
    reject('thenable rejected');
  }
};

export const chainThenable14 = {
  then(resolve: (val: Object) => void) {
    resolve({
      then(resolveInner: (val: string) => void) {
        setTimeout(() => resolveInner('chained result'), 10);
      }
    });
  }
};

export const fakeThenable18 = { then: 'not a function', value: 50 };

export async function PromiseResolveTest025() {

  async function* resolveGen() {
    yield Promise.resolve(10);
    yield Promise.resolve('20');
    yield Promise.resolve(false);
  }

  const results: (number | string | boolean)[] = [];
  for await (const p of resolveGen()) {
    results.push(await p);
  }
  return results
}

export const delayedThenable28 = {
  then(resolve: (val: string) => void) {
    setTimeout(() => resolve('delayed'), 20);
  }
};

export const throwingThenable23 = {
  then() {
    throw new Error('sync throw in then');
  }
};


export const nestedRejectThenable31 = {
  then(resolve: (val: Object) => void) {
    resolve(Promise.reject(new Error('nested reject')));
  }
};

export const asyncThenable34 = {
  async then(resolve: (val: string) => void) {
    await new Promise<string>(resolve => setTimeout(resolve, 15));
    resolve('async resolved');
  }
};

export const badThenable37 = {
  then: (resolve: null, reject: (err: Error) => void) => {
    reject(new Error('resolve is null'));
  }
};

export const conditionalThenable = (shouldReject: boolean) => ({
  then(resolve: (val: string) => void, reject: (err: string) => void) {
    if (shouldReject) {
      reject('conditional reject');
    } else {
      resolve('conditional resolve');
    }
  }
});

export const nestedDelayedThenable = {
  then(resolve: (val: Object) => void) {
    setTimeout(() => {
      resolve({
        then(resolveInner: (val: number) => void) {
          setTimeout(() => resolveInner(200), 10);
        }
      });
    }, 15);
  }
};

export async function PromiseResolveTest043() {
  let sideEffect = 0;
  const statefulThenable43 = {
    then(resolve: (val: number) => void) {
      sideEffect += 10;
      resolve(sideEffect);
    }
  };

  const promise = Promise.resolve(statefulThenable43);
  const result = await promise;

  return (result) == 10 && sideEffect == 10;
}


const level3Thenable51 = {
  then(resolve: (val: number) => void) {
    setTimeout(() => resolve(10), 5);
  }
};
const level2Thenable51 = {
  then(resolve: (val: Object) => void) {
    setTimeout(() => resolve(level3Thenable51), 10);
  }
};

export const level1Thenable51 = {
  then(resolve: (val: Object) => void) {
    setTimeout(() => resolve(level2Thenable51), 15);
  }
};


export async function PromiseResolveTest055() {
  let shared = 0;
  const level3 = {
    then(resolve: (val: number) => void) {
      shared = 2;
      resolve(shared);
    }
  };
  const level2 = {
    then(resolve: (val: Object) => void) {
      resolve(Promise.resolve(level3).then(val => {
        shared = val * 3;
        return shared;
      }));
    }
  };
  const level1 = Promise.resolve(level2).then((val: number) => {
    shared = val + 1;
    return shared;
  });

  const result = await level1;
  return (result) == 7 && (shared) == 7;
}

export const thenable64 = {
  then(resolve: (val: Object) => void) {
    setTimeout(() => resolve({
      then(resolve: (val: number) => void) {
        setTimeout(() => resolve(100), 15);
      }
    }), 10);
  }
};

export async function PromiseResolveTest066() {
  const values: number[] = [];

  function* gen() {
    yield Promise.resolve(1);
    yield Promise.resolve(new Promise<number>(resolve => setTimeout(() => resolve(2), 5)));
    yield Promise.resolve(3);
  }

  for await (const p of gen()) {
    values.push(await p);
  }
  return values
}

export async function PromiseResolveTest067() {
  let flag = true;
  const level4 = {
    then(resolve: (val: string) => void) {
      resolve(flag ? 'cond-true' : 'cond-false');
    }
  };
  const level3 = {
    then(resolve: (val: Object) => void) {
      resolve(Promise.resolve(level4));
    }
  };
  const level2 = {
    then(resolve: (val: Object) => void) {
      resolve(Promise.resolve(level3));
    }
  };
  const level1 = Promise.resolve(level2);

  const result1 = await level1;
  flag = false;
  const result2 = await level1;

  return result1 == 'cond-true' && result2 == 'cond-true';
}

export async function PromiseResolveTest072() {
  const timeLog: string[] = [];
  const level3 = {
    then(resolve: (val: string) => void) {
      setTimeout(() => {
        timeLog.push('L3: 5ms');
        resolve('L3');
      }, 5);
    }
  };
  const level2 = {
    then(resolve: (val: Object) => void) {
      setTimeout(() => {
        timeLog.push('L2: 10ms');
        resolve(Promise.resolve(level3));
      }, 10);
    }
  };
  const level1 = Promise.resolve(level2).then(val => {
    timeLog.push(`L1: ${val}`);
    return val;
  });

  await level1;
  return timeLog
}

export async function PromiseResolveTest075() {
  const timeLog: string[] = [];

  async function* gen() {
    yield Promise.resolve(new Promise<number>(resolve => setTimeout(() => {
      timeLog.push('1: 5ms');
      resolve(1);
    }, 5)));
    yield Promise.resolve(new Promise<number>(resolve => setTimeout(() => {
      timeLog.push('2: 10ms');
      resolve(2);
    }, 10)));
    yield Promise.resolve(new Promise<number>(resolve => setTimeout(() => {
      timeLog.push('3: 15ms');
      resolve(3);
    }, 15)));
    yield Promise.resolve(new Promise<number>(resolve => setTimeout(() => {
      timeLog.push('4: 20ms');
      resolve(4);
    }, 20)));
    yield Promise.resolve(new Promise<number>(resolve => setTimeout(() => {
      timeLog.push('5: 25ms');
      resolve(5);
    }, 25)));
  }

  const results: number[] = [];
  const start = Date.now();
  for await (const p of gen()) {
    results.push(await p);
  }
  const end = Date.now();

  if (results.join(', ') != '1, 2, 3, 4, 5') {
    return []
  }
  ;
  return timeLog
}

export async function PromiseResolveTest077() {
  const level4 = { then: (res: (v: number) => void) => setTimeout(() => res(1), 2) };
  const level3 = { then: (res: (v: Object) => void) => setTimeout(() => res(Promise.resolve(level4)), 3) };
  const level2 = { then: (res: (v: Object) => void) => setTimeout(() => res(Promise.resolve(level3)), 5) };
  const level1 = Promise.resolve(level2);

  const result = await level1;
  return result
}

export async function PromiseResolveTest084() {
  let baseDelay = 5;
  const level3 = {
    then(resolve: (v: number) => void) {
      setTimeout(() => resolve(1), baseDelay);
    }
  };
  const level2 = {
    then(resolve: (v: Object) => void) {
      baseDelay += 5;
      setTimeout(() => resolve(Promise.resolve(level3)), baseDelay);
    }
  };
  const level1 = Promise.resolve(level2);

  const result = await level1;
  return result
}

export const parallelThenable92 = {
  then(resolve: (vals: number[]) => void) {
    const p1 = new Promise<number>(resolve => setTimeout(() => {
      resolve(10);
    }, 10));
    const p2 = new Promise<number>(resolve => setTimeout(() => {
      resolve(20);
    }, 5));
    Promise.all([p1, p2]).then(vals => resolve(vals));
  }
};

export async function PromiseResolveTest093() {
  const timeLog: string[] = [];

  async function* conditionalGen(useLongDelay: boolean) {
    yield Promise.resolve(new Promise<number>(resolve => setTimeout(() => {
      timeLog.push(useLongDelay ? 'long: 20ms' : 'short: 5ms');
      resolve(useLongDelay ? 100 : 50);
    }, useLongDelay ? 20 : 5)));
  }

  const gen1 = conditionalGen(true);
  const gen2 = conditionalGen(false);
  const [res1, res2] = await Promise.all([(await gen1.next()).value, (await gen2.next()).value]);

  if (res1 == 100 && res2 == 50) {
    return timeLog
  }
  return []
}

export const createThenable96 = (depth: number, value: number): Object => {
  if (depth === 0) {
    return value;
  }
  return {
    then(resolve: (val: Object) => void) {
      setTimeout(() => resolve(createThenable96(depth - 1, value * 2)), 5);
    }
  };
};

export async function PromiseResolveTest008() {
  const testLog = [];
  let allPassed = true;

  // Test 1: Resolve primitive value
  const test1 = Promise.resolve('basic-value')
    .then(value => {
      testLog.push(`Test1: Resolved primitive - ${value}`);
      return value;
    });

  // Test 2: Resolve already resolved promise
  const preResolved = Promise.resolve(100);
  const test2 = Promise.resolve(preResolved)
    .then(value => {
      testLog.push(`Test2: Resolved existing promise - ${value}`);
      return value;
    });

  // Test 3: Resolve thenable object
  const thenable = {
    then: function (resolve) {
      setTimeout(() => resolve('thenable-resolved'), 10);
    }
  };
  const test3 = Promise.resolve(thenable)
    .then(value => {
      testLog.push(`Test3: Resolved thenable - ${value}`);
      return value;
    });

  // Test 4: Chained resolution
  const test4 = Promise.resolve(2)
    .then(value => Promise.resolve(value * 2))
    .then(value => {
      testLog.push(`Test4: Chained resolution result - ${value}`);
      return value;
    });

  // Test 5: Resolve null and undefined
  const test5 = Promise.resolve(null)
    .then(value => {
      testLog.push(`Test5: Resolved null - ${value}`);
      return Promise.resolve(undefined);
    })
    .then(value => {
      testLog.push(`Test5: Resolved undefined - ${value}`);
      return true;
    });

  // Wait for all tests to complete
  const results = await Promise.all([test1, test2, test3, test4, test5]);

  // Validate results
  if (results[0] !== 'basic-value') {
    testLog.push('Test1: Failed - Primitive resolution error');
    allPassed = false;
  }

  if (results[1] !== 100) {
    testLog.push('Test2: Failed - Existing promise resolution error');
    allPassed = false;
  }

  if (results[2] !== 'thenable-resolved') {
    testLog.push('Test3: Failed - Thenable resolution error');
    allPassed = false;
  }

  if (results[3] !== 4) {
    testLog.push('Test4: Failed - Chained resolution error');
    allPassed = false;
  }

  if (results[4] !== true) {
    testLog.push('Test5: Failed - Null/undefined resolution error');
    allPassed = false;
  }

  testLog.push(`Test summary: ${allPassed ? 'All passed' : 'Some failed'}`);
  return allPassed
}
export interface User {
  id: number;
  name: string;
}

export interface Post {
  id: number;
  userId: number;
  title: string;
}
export type type017_1={ data: string }
export type type017={ success: boolean }
export type type012={ level: number; time: number }
export type type034={ user: User, posts: Post[] }
export type type015_2={ sum: number; avg: number }
export type type015_1={ id: number; value: number; updated: number }
export type type015={ id: number; widgets: number[] }
export type type010_5={ status: string; approvedAt: number }
export type type010_4={ hasCopyright: boolean; matches: number }
export type type010_3={ hasProfanity: boolean; words: string[] }
export type type010_2={ isSpam: boolean; score: number }
export type type010={ id: number; status: string }
export type type08_5={ estimated: string; trackingId: string }
export type type08_4={ allocated: boolean; warehouseId: number }
export type type08_3={ success: boolean; transactionId: string }
export type type08_2={ id: number; status: string }
export type type08={ id: number; qty: number }[]
export type type09_3={ id: number; name: string }[]
export type type09_2={ userId: number; name: string }[]
export type type09={ id: number; content: string; likes: number }[]
export type type07_3={ id: number; name: string }[]
export type type07_2={ id: number; name: string; parentId?: number }
export type type07={ id: number; name: string; categoryId: number }
export type type06_3={id: number; name: string; currency: string}
export type type06_2={id: number; city: string; countryId: number}
export type type06={id: number; name: string; addressId: number}
export type type05_3={ id: number; message: string }
export type type05_2={ id: number; roles: string[] }
export type type05={ token: string }
export type type02={ id: number; price: number }
export type type04={ success: boolean }
export type type01={ id: number; name: string }
export type type01_2={ id: number; userId: number }
export async function NestedPromiseTest020(){
  type WorkflowData = {
    raw: string;
    parsed?: string[];
    filtered?: string[];
    transformed?: number[];
    summed?: number;
    doubled?: number;
    validated?: boolean;
    result?: string;
  };

  const level1 = (): Promise<WorkflowData> => new Promise<WorkflowData>((resolve) => {
    resolve({ raw: 'apple,banana,cherry,date,eggplant' });
  });

  const level2 = (data: WorkflowData): Promise<WorkflowData> => new Promise<WorkflowData>((resolve) => {
    resolve({ ...data, parsed: data.raw.split(',') });
  });

  const level3 = (data: WorkflowData): Promise<WorkflowData> => new Promise<WorkflowData>((resolve) => {
    const filtered = data.parsed!.filter(item => item.length > 5);
    resolve({ ...data, filtered });
  });

  const level4 = (data: WorkflowData): Promise<WorkflowData> => new Promise<WorkflowData>((resolve) => {
    const transformed = data.filtered!.map(item => item.length);
    resolve({ ...data, transformed });
  });

  const level5 = (data: WorkflowData): Promise<WorkflowData> => new Promise<WorkflowData>((resolve) => {
    const summed = data.transformed!.reduce((a, b) => a + b, 0);
    resolve({ ...data, summed });
  });

  const level6 = (data: WorkflowData): Promise<WorkflowData> => new Promise<WorkflowData>((resolve) => {
    resolve({ ...data, doubled: data.summed! * 2 });
  });

  const level7 = (data: WorkflowData): Promise<WorkflowData> => new Promise<WorkflowData>((resolve) => {
    resolve({ ...data, validated: data.doubled! > 30 });
  });

  const level8 = (data: WorkflowData): Promise<string> => new Promise<string>((resolve) => {
    resolve(data.validated! ? 'success' : 'failure');
  });

  const result = await level1()
    .then(data => level2(data))
    .then(data => level3(data))
    .then(data => level4(data))
    .then(data => level5(data))
    .then(data => level6(data))
    .then(data => level7(data))
    .then(data => level8(data));
  return result
}

export async function NestedPromiseTest014(){
  type Data = { values: number[]; sum?: number; avg?: number; count?: number };

  const level1 = (): Promise<Data> => new Promise<Data>((resolve) => resolve({ values: [1, 2, 3] }));
  const level2 = (data: Data): Promise<Data> => new Promise<Data>((resolve) => resolve({
    ...data,
    values: [...data.values, 4, 5]
  }));
  const level3 = (data: Data): Promise<Data> => new Promise<Data>((resolve) => {
    const sum = data.values.reduce((a, b) => a + b, 0);
    resolve({ ...data, sum });
  });
  const level4 = (data: Data): Promise<Data> => new Promise<Data>((resolve) => {
    resolve({ ...data, count: data.values.length });
  });
  const level5 = (data: Data): Promise<Data> => new Promise<Data>((resolve) => {
    resolve({
      ...data, avg: (data.sum / data.count!)
    });
  });
  const level6 = (data: Data): Promise<boolean> => new Promise<boolean>((resolve) => {
    resolve(data.avg! > 3);
  });

  const result = await level1()
    .then(data => level2(data))
    .then(data => level3(data))
    .then(data => level4(data))
    .then(data => level5(data))
    .then(data => level6(data));
  return result
}
export async function PromiseAsyncAwaitTest037(){
  class CancellationToken {
    private isCancelled = false;

    cancel(): void {
      this.isCancelled = true;
    }

    throwIfCancelled(): void {
      if (this.isCancelled) {
        throw new Error("Cancelled");
      }
    }
  }

  async function level8(ct: CancellationToken): Promise<number> {
    return new Promise<number>((resolve, reject) => {
      const timer = setTimeout(() => {
        try {
          ct.throwIfCancelled();
          resolve(8);
        } catch (e) {
          reject(e);
        }
      }, 20);

      // Cleanup if cancelled
      const checkCancel = setInterval(() => {
        clearTimeout(timer);
        clearInterval(checkCancel);
        reject(new Error("Cancelled"));
      }, 1);
    });
  }

  async function level7(ct: CancellationToken): Promise<number> {
    const res = await level8(ct);
    ct.throwIfCancelled();
    return res * 7;
  }

  async function level6(ct: CancellationToken): Promise<number> {
    const res = await level7(ct);
    ct.throwIfCancelled();
    return res + 6;
  }

  async function level5(ct: CancellationToken): Promise<number> {
    const res = await level6(ct);
    ct.throwIfCancelled();
    return res * 5;
  }

  async function level4(ct: CancellationToken): Promise<number> {
    const res = await level5(ct);
    ct.throwIfCancelled();
    return res - 4;
  }

  async function level3(ct: CancellationToken): Promise<number> {
    const res = await level4(ct);
    ct.throwIfCancelled();
    return res * 3;
  }

  async function level2(ct: CancellationToken): Promise<number> {
    // Cancel after short delay
    setTimeout(() => ct.cancel(), 5);
    try {
      return await level3(ct);
    } catch (e) {
      return -1;
    }
  }

  async function level1(): Promise<number> {
    const ct = new CancellationToken();
    return await level2(ct);
  }

  const result = await level1();
  return result
}
export async function NestedPromiseTest011(){
  type User = { id: number; name?: string; email?: string; active?: boolean };

  const level1 = (): Promise<User> => new Promise<User>((resolve) => resolve({ id: 1 }));
  const level2 = (user: User): Promise<User> => new Promise<User>((resolve) => resolve({ ...user, name: 'Test' }));
  const level3 =
    (user: User): Promise<User> => new Promise<User>((resolve) => resolve({ ...user, email: 'test@example.com' }));
  const level4 = (user: User): Promise<User> => new Promise<User>((resolve) => resolve({ ...user, active: true }));
  const level5 =
    (user: User): Promise<User> => new Promise<User>((resolve) => resolve({ ...user, id: user.id * 10 }));
  const level6 = (user: User): Promise<User> => new Promise<User>((resolve) => resolve({
    ...user,
    name: user.name?.toUpperCase()
  }));
  const level7 =
    (user: User): Promise<boolean | undefined> => new Promise<boolean | undefined>((resolve) => resolve(!!user.email &&
    user.active));

  const result = await level1()
    .then(user => level2(user))
    .then(user => level3(user))
    .then(user => level4(user))
    .then(user => level5(user))
    .then(user => level6(user))
    .then(user => level7(user));
  return result
}
export async function PromiseAsyncAwaitTest028(){
  interface Node {
    value: number;
    children?: Node[];
  }

  async function level9(node: Node): Promise<Node> {
    return new Promise<Node>((resolve) => {
      resolve({ ...node, value: node.value * 9 });
    });
  }

  async function level8(node: Node): Promise<Node> {
    const res = await level9(node);
    return {
      ...res,
      children: res.children ? await Promise.all(res.children.map(child => level9(child))) : undefined
    };
  }

  async function level7(node: Node): Promise<Node> {
    const res = await level8(node);
    return { ...res, value: res.value + 7 };
  }

  async function level6(node: Node): Promise<Node> {
    const res = await level7(node);
    return {
      ...res,
      children: res.children ? await Promise.all(res.children.map(child => level7(child))) : undefined
    };
  }

  async function level5(node: Node): Promise<Node> {
    const res = await level6(node);
    return { ...res, value: res.value * 5 };
  }

  async function level4(node: Node): Promise<Node> {
    const res = await level5(node);
    return {
      ...res,
      children: res.children ? await Promise.all(res.children.map(child => level5(child))) : undefined
    };
  }

  async function level3(node: Node): Promise<Node> {
    const res = await level4(node);
    return { ...res, value: res.value - 3 };
  }

  async function level2(node: Node): Promise<Node> {
    const res = await level3(node);
    return {
      ...res,
      children: res.children ? await Promise.all(res.children.map(child => level3(child))) : undefined
    };
  }

  async function level1(node: Node): Promise<number> {
    const res = await level2(node);
    const sum = (n: Node): number => {
      return n.value + (n.children ? n.children.reduce((s, c) => s + sum(c), 0) : 0);
    };
    return sum(res);
  }

  const initialNode: Node = {
    value: 1,
    children: [{ value: 2 }]
  };

  const result = await level1(initialNode);
  return result
}
export async function PromiseAsyncAwaitTest038(){
  interface ValidatedData {
    value: number;
    isValid: boolean;
    errors: string[];
  }

  async function level9(data: ValidatedData): Promise<ValidatedData> {
    return new Promise<ValidatedData>((resolve) => {
      const newData = { ...data };
      if (newData.value > 1000) {
        newData.isValid = false;
        newData.errors.push("Value too large");
      }
      resolve(newData);
    });
  }

  async function level8(data: ValidatedData): Promise<ValidatedData> {
    if (!data.isValid) {
      return data;
    }
    const res = await level9(data);
    return res;
  }

  async function level7(data: ValidatedData): Promise<ValidatedData> {
    if (!data.isValid) {
      return data;
    }
    const newData = { ...data };
    newData.value = Math.round(newData.value);
    return await level8(newData);
  }

  async function level6(data: ValidatedData): Promise<ValidatedData> {
    if (!data.isValid) {
      return data;
    }
    const res = await level7(data);
    return res;
  }

  async function level5(data: ValidatedData): Promise<ValidatedData> {
    if (!data.isValid) {
      return data;
    }
    const newData = { ...data };
    if (newData.value < 0) {
      newData.isValid = false;
      newData.errors.push("Negative value");
    }
    return await level6(newData);
  }

  async function level4(data: ValidatedData): Promise<ValidatedData> {
    if (!data.isValid) {
      return data;
    }
    const res = await level5(data);
    return res;
  }

  async function level3(data: ValidatedData): Promise<ValidatedData> {
    if (!data.isValid) {
      return data;
    }
    const newData = { ...data };
    newData.value = newData.value * 2;
    return await level4(newData);
  }

  async function level2(input: number): Promise<ValidatedData> {
    const initialData: ValidatedData = {
      value: input,
      isValid: true,
      errors: []
    };
    return await level3(initialData);
  }

  async function level1(input: number): Promise<boolean> {
    const result = await level2(input);
    return result.isValid;
  }

  const result = await level1(501);
  return result
}
export async function NestedPromiseTest012(){
  const fetchNumbers = (count: number): Promise<number[]> => {
    return new Promise<number[]>((resolve) => {
      const nums = Array.from({ length: count }, (_, i) => i + 1);
      resolve(nums);
    });
  };

  const level1 = async (): Promise<number[]> => {
    const [a, b] = await Promise.all([fetchNumbers(2), fetchNumbers(2)]);
    return [...a, ...b];
  };

  const level2 = async (nums: number[]): Promise<number[]> => {
    const doubled = nums.map(n => new Promise<number>(resolve => resolve(n * 2)));
    return await Promise.all(doubled);
  };

  const level3 = async (nums: number[]): Promise<number[]> => {
    const filtered = nums.map(n => new Promise<number | null>(resolve =>
    resolve(n > 3 ? n : null)
    ));
    const results = await Promise.all(filtered);
    return results.filter(n => n !== null) as number[];
  };

  const level4 = async (nums: number[]): Promise<number> => {
    const summed = nums.reduce((sum, n) => sum + n, 0);
    return new Promise<number>(resolve => resolve(summed));
  };

  const level5 = async (total: number): Promise<number> => {
    return new Promise<number>(resolve => resolve(total / 2));
  };

  const result = await level1()
    .then(nums => level2(nums))
    .then(nums => level3(nums))
    .then(nums => level4(nums))
    .then(total => level5(total));
  return result
}
export async function PromiseAsyncAwaitTest036(){
  class StreamProcessor {
    private data: number[] = [];

    async write(chunk: number): Promise<void> {
      return new Promise<void>((resolve) => {
        setTimeout(() => {
          this.data.push(chunk);
          resolve();
        }, 1);
      });
    }

    async read(): Promise<number[]> {
      return new Promise<number[]>((resolve) => {
        setTimeout(() => resolve([...this.data]), 1);
      });
    }
  }

  async function level7(processor: StreamProcessor, value: number): Promise<void> {
    await processor.write(value * 7);
  }

  async function level6(processor: StreamProcessor, values: number[]): Promise<void> {
    for (const v of values) {
      await level7(processor, v);
    }
  }

  async function level5(values: number[]): Promise<number[]> {
    const processor = new StreamProcessor();
    await level6(processor, values);
    return processor.read();
  }

  async function level4(values: number[]): Promise<number[]> {
    const res = await level5(values);
    return res.map(v => v / 4);
  }

  async function level3(values: number[]): Promise<number[]> {
    const res = await level4(values);
    return res.filter(v => v > 10);
  }

  async function level2(values: number[]): Promise<number[]> {
    const res = await level3(values);
    return res.map(v => v + 2);
  }

  async function level1(values: number[]): Promise<number> {
    const res = await level2(values);
    return res.reduce((sum, v) => sum + v, 0);
  }

  const result = await level1([5, 6, 7, 8, 9]);
  return result
}
export async function PromiseAsyncAwaitTest021(){
  async function level2a(): Promise<number> {
    return new Promise<number>((resolve) => {
      setTimeout(() => resolve(100), 10);
    });
  }

  async function level2b(): Promise<number> {
    return new Promise<number>((_, reject) => {
      setTimeout(() => reject(new Error("failed")), 5);
    });
  }

  async function level1(): Promise<number> {
    const results = await Promise.allSettled([level2a(), level2b()]);
    const fulfilled = results.filter(r => r.status === 'fulfilled') as PromiseFulfilledResult<number>[];
    return fulfilled.reduce((sum, r) => sum + r.value, 0);
  }

  const result = await level1();
  return result
}
export function base64Encode(str) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
  let result = '';
  let i = 0;

  while (i < str.length) {
    // 取三个字符的ASCII码
    const c1 = str.charCodeAt(i++) & 0xff;
    const c2 = i < str.length ? str.charCodeAt(i++) & 0xff : 0;
    const c3 = i < str.length ? str.charCodeAt(i++) & 0xff : 0;

    // 拆分位为4个6位组
    const e1 = (c1 >> 2) & 0x3f;
    const e2 = ((c1 & 0x03) << 4) | ((c2 >> 4) & 0x0f);
    const e3 = i > str.length + 1 ? 64 : ((c2 & 0x0f) << 2) | ((c3 >> 6) & 0x03);
    const e4 = i > str.length ? 64 : c3 & 0x3f;

    // 转成Base64字符
    result += chars.charAt(e1) + chars.charAt(e2) + chars.charAt(e3) + chars.charAt(e4);
  }
  return result;
}

// 纯JavaScript实现Base64解码（不依赖任何外部API）
export function base64Decode(b64Str) {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
  let result = '';
  let i = 0;

  // 去除非法字符
  b64Str = b64Str.replace(/[^A-Za-z0-9+/=]/g, '');

  while (i < b64Str.length) {
    // 取4个Base64字符的索引
    const e1 = chars.indexOf(b64Str.charAt(i++));
    const e2 = chars.indexOf(b64Str.charAt(i++));
    const e3 = chars.indexOf(b64Str.charAt(i++));
    const e4 = chars.indexOf(b64Str.charAt(i++));

    // 合并为三个8位组
    const c1 = (e1 << 2) | (e2 >> 4);
    const c2 = ((e2 & 0x0f) << 4) | (e3 >> 2);
    const c3 = ((e3 & 0x03) << 6) | e4;

    // 转成字符（跳过填充字符）
    result += String.fromCharCode(c1);
    if (e3 !== 64) result += String.fromCharCode(c2);
    if (e4 !== 64) result += String.fromCharCode(c3);
  }
  return result;
}