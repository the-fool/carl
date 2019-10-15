import asyncio
import sys


q = asyncio.Queue()
lock = asyncio.Lock()

async def consume():
    while True:
        await asyncio.sleep(0.5)
        if not q.empty():
            await lock.acquire()
            agg = []
            while not q.empty():
                item = await q.get()
                agg.append(item)
            
            lock.release()
            print("got agg ", agg)

async def produce():
    for line in sys.stdin:
        await lock.acquire()
        await q.put(line.rstrip())
        lock.release()
        await asyncio.sleep(0.00001)

    await asyncio.sleep(1) 
    sys.exit()

coros = asyncio.gather(consume(), produce())
asyncio.get_event_loop().run_until_complete(coros)
