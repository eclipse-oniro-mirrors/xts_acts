'use static'


export class Event {
  constructor() {
    this.promise = new Promise<boolean>((resolve: (val: boolean) => void) => {
      this.resolveFn = resolve;
    })
  }

  public Wait(): boolean {
    return waitForCompletion<boolean>(() => {
      return this.promise;
    });
  }

  public Fire(val: boolean = true) {
    this.resolveFn!(val);
  }

  private promise: Promise<boolean>;
  private resolveFn: ((val: boolean) => void) | null = null;
}

export class BaseClass {
  private count: number = 0;
  public lock_: AsyncLock = new AsyncLock()

  public async getCount(): Promise<number> {
    return this.lock_.lockAsync((): number => {
      return this.count;
    })
  }

  public async increaseCount() {
    await this.lock_.lockAsync((): void => {
      this.count++;
    })
  }
}


export class CountClass {
  public count: int = 0

  public setCount(value: int) {
    this.count = value
  }

  public getCount(): int {
    return this.count;
  }
}

export class SharedJob<T> {
  private jobs: Array<T>;

  constructor(jobs: Array<T>) {
    this.jobs = jobs;
  }

  public Await() {
    for (let job of this.jobs) {
      (job as Job<void>).Await();
    }
  }
}

export async function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}