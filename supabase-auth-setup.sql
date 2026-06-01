drop policy if exists "Allow public read dashboard state" on public.dashboard_state;
drop policy if exists "Allow public insert dashboard state" on public.dashboard_state;
drop policy if exists "Allow public update dashboard state" on public.dashboard_state;

create policy "Allow authenticated read dashboard state"
on public.dashboard_state
for select
to authenticated
using (true);

create policy "Allow authenticated insert dashboard state"
on public.dashboard_state
for insert
to authenticated
with check (true);

create policy "Allow authenticated update dashboard state"
on public.dashboard_state
for update
to authenticated
using (true)
with check (true);
