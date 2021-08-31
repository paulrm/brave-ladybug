DROP TABLE IF EXISTS metrics;
CREATE TABLE metrics (
    metricname      varchar(20),
    metricvalue     integer NOT NULL,
    ts              date
);
GRANT SELECT ON public.metrics TO postgres;