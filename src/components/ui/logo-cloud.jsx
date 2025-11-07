import { InfiniteSlider } from '@/components/ui/infinite-slider';
import { cn } from '@/lib/utils';

export function LogoCloud({ className, logos, ...props }) {
  return (
    <div
      {...props}
      className={cn(
        'overflow-hidden py-4',
        className
      )}
      style={{
        maskImage: 'linear-gradient(to right, transparent, black 10%, black 90%, transparent)',
        WebkitMaskImage: 'linear-gradient(to right, transparent, black 10%, black 90%, transparent)'
      }}
    >
      <InfiniteSlider gap={60} speed={80} speedOnHover={25}>
        {logos.map((logo, index) => (
          <img
            alt={logo.alt}
            className="pointer-events-none h-8 select-none brightness-0 invert opacity-80 hover:opacity-100 transition-opacity"
            key={`logo-${logo.alt}-${index}`}
            loading="lazy"
            src={logo.src}
            style={{ height: '32px', width: 'auto' }}
          />
        ))}
      </InfiniteSlider>
    </div>
  );
}
