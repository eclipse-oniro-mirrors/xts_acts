'use static'


export class Event {
  constructor() {
    this.promise = new Promise<boolean>((resolve: (val: boolean) => void) => {
      this.resolveFn = resolve;
    })
  }

  public Wait(): boolean {
    return this.promise.awaitSync();
  }

  public Fire(val: boolean = true): void {
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

  public async increaseCount(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.count++;
    })
  }
}


export class CountClass {
  public count: int = 0

  public setCount(value: int): void {
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

  public async Await() {
    for (let job of this.jobs) {
      await job;
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
